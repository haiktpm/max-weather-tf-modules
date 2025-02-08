# Create IAM Role for EKS Cluster
resource "aws_iam_role" "eks_role" {
  name = "${var.cluster_name}-eks-role"

  assume_role_policy = jsonencode({
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "eks.amazonaws.com"
      }
    }]
    Version = "2012-10-17"
  })

  tags = var.tags
}

# Attach necessary policies to the IAM role
resource "aws_iam_role_policy_attachment" "eks_policy" {
  role       = aws_iam_role.eks_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}

# Create EKS Cluster
resource "aws_eks_cluster" "this" {
  name     = var.cluster_name
  role_arn = aws_iam_role.eks_role.arn

  vpc_config {
    subnet_ids              = var.subnet_ids
    endpoint_public_access  = var.enable_public_access
    endpoint_private_access = var.enable_private_access
    public_access_cidrs     = var.public_access_cidrs
    security_group_ids = var.security_group_ids
  }

  tags = var.tags
}

resource "aws_eks_addon" "this" {
  for_each = { for addon in var.eks_addons : addon.name => addon }

  cluster_name         = aws_eks_cluster.this.name
  addon_name          = each.value.name
  addon_version       = lookup(each.value, "version", null)
  resolve_conflicts   = lookup(each.value, "resolve_conflicts", "OVERWRITE")

  service_account_role_arn = lookup(each.value, "service_account_role_arn", null)

  tags = merge(
    {
      Name = "eks-addon-${each.value.name}"
    },
    var.tags
  )
}

# Get EKS OIDC Provider URL
data "aws_eks_cluster" "this" {
  name = aws_eks_cluster.this.name
}

data "aws_eks_cluster_auth" "this" {
  name = aws_eks_cluster.this.name
}

data "tls_certificate" "eks" {
  url = data.aws_eks_cluster.this.identity[0].oidc[0].issuer
}

# Create IAM OIDC Provider
resource "aws_iam_openid_connect_provider" "eks" {
  client_id_list  = ["sts.amazonaws.com"]
  thumbprint_list = [data.tls_certificate.eks.certificates[0].sha1_fingerprint]
  url             = data.aws_eks_cluster.this.identity[0].oidc[0].issuer

  tags = merge(
    {
      Name = "${aws_eks_cluster.this.name}-oidc-provider"
    },
    var.tags
  )
}
