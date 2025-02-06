# AWS EKS Module

This Terraform module creates an AWS EKS cluster with IAM role and security group configuration.

## Usage

```hcl
module "eks" {
  source       = "./aws-eks-module"
  cluster_name = "my-eks-cluster"
  subnet_ids   = ["subnet-12345678", "subnet-87654321"]
  tags = {
    "Environment" = "Dev"
  }
}
