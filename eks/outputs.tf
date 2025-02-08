output "eks_cluster_id" {
  description = "The ID of the created EKS cluster"
  value       = aws_eks_cluster.this.id
}

output "eks_cluster_arn" {
  description = "The ARN of the EKS cluster"
  value       = aws_eks_cluster.this.arn
}

output "eks_cluster_endpoint" {
  description = "The API server endpoint of the EKS cluster"
  value       = aws_eks_cluster.this.endpoint
}

output "eks_cluster_certificate_authority" {
  description = "The EKS cluster certificate authority data"
  value       = aws_eks_cluster.this.certificate_authority[0].data
}

output "oidc_provider_arn" {
  description = "ARN of the OIDC provider"
  value       = aws_iam_openid_connect_provider.eks.arn
}