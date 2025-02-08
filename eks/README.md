# AWS EKS Module

This Terraform module creates an AWS EKS cluster with IAM role and security group configuration. It allows **public access** to the API endpoint if enabled.

## Usage

```hcl
module "eks" {
  source                = "./aws-eks-module"
  cluster_name          = "my-eks-cluster"
  subnet_ids            = ["subnet-12345678", "subnet-87654321"]
  security_group_ids    = ["sg-12345678", "sg-876524321"]
  enable_public_access  = true
  enable_private_access = false
  public_access_cidrs   = ["0.0.0.0/0"] # Allow access from anywhere
  nodegroup_subnet_ids  = ["subnet-12345678", "subnet-87654321"]
  node_role_arn         = "role_arn"
  instance_types        = "t3.medium"
  desired_capacity      = 2
  max_capacity          = 2
  min_capacity          = 2
  tags = {
    "Environment"       = "Dev"
  }
}
