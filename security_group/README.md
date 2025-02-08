# AWS IAM Security Group Module

This module creates an AWS security group with customizable ingress and egress rules.

## Usage

```hcl
module "iam_security_group" {
  source                    = "./aws-iam-security-group-module"
  security_group_name       = "my-security-group"
  security_group_description = "Security group for my app"
  vpc_id                    = "vpc-12345678"

  ingress_rules = [
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]

  egress_rules = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]

  tags = {
    "Environment" = "Production"
  }
}
