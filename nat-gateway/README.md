# AWS NAT Gateway Module

This module provisions an **AWS NAT Gateway** in a public subnet, allowing private subnets to access the internet.

## 🚀 Usage

```hcl
module "nat_gateway" {
  source            = "./aws-nat-gateway"
  subnet_id         = "subnet-12345678"
  nat_gateway_name  = "my-nat-gateway"

  tags = {
    "Environment" = "Production"
  }
}
