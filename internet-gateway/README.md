# AWS Internet Gateway Module

This module provisions an **AWS Internet Gateway** and attaches it to a VPC, allowing public internet access.

## 🚀 Usage

```hcl
module "internet_gateway" {
  source   = "./aws-internet-gateway"
  vpc_id   = "vpc-12345678"
  igw_name = "my-internet-gateway"

  tags = {
    "Environment" = "Production"
  }
}
