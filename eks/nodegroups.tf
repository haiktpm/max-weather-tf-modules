resource "aws_eks_node_group" "eks_nodegroup" {
  cluster_name    = var.cluster_name
  node_group_name = "eks-nodegroup"
  node_role_arn   = var.node_role_arn
  subnet_ids      = var.nodegroup_subnet_ids

  scaling_config {
    desired_size = var.desired_capacity
    max_size     = var.max_capacity
    min_size     = var.min_capacity
  }

  instance_types = var.instance_types
  tags = var.tags
}
