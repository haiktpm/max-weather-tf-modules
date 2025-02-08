# AWS Route Table Association Module

This module creates associations between an **AWS Route Table** and multiple subnets.

## 🚀 Usage

```hcl
module "route_table_association" {
  source         = "./aws-route-table-association"
  route_table_id = "rtb-12345678"
  subnet_ids     = ["subnet-12345678", "subnet-87654321"]
}
