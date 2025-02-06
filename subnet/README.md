# AWS Subnet Module

This module creates an AWS subnet inside a specified VPC.

## Usage

```hcl
module "subnet" {
  source                = "./aws-subnet-module"
  vpc_id                = "vpc-12345678"
  cidr_block            = "10.0.1.0/24"
  availability_zone     = "us-east-1a"
  map_public_ip_on_launch = true
  subnet_name           = "my-subnet"
  tags = {
    "Environment" = "Dev"
  }
}
