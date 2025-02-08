# AWS Route Table Module

This Terraform module creates an AWS Route Table and allows associating it with subnets.

## Usage

```hcl
module "route_table" {
  source            = "./aws-route-table-module"
  route_table_name  = "public-route-table"
  vpc_id           = "vpc-12345678"

  routes = [
    {
      destination_cidr_block = "0.0.0.0/0"
      gateway_id             = "igw-12345678" # Internet Gateway ID for public subnets
    }
  ]

  subnet_ids = ["subnet-12345678", "subnet-87654321"]

  tags = {
    "Environment" = "Production"
  }
}
