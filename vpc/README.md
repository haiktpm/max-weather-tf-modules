# AWS VPC Module

This module creates an AWS VPC with configurable CIDR block, DNS support, and tagging.

## Usage

```hcl
module "vpc" {
  source               = "./aws-vpc-module"
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true
  vpc_name             = "my-vpc"
  tags = {
    "Environment" = "Dev"
  }
}
