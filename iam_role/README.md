# AWS IAM Role Module

This module creates an IAM role with the option to attach policies and apply tags.

## Usage

```hcl
module "iam_role" {
  source               = "./aws-iam-role-module"
  role_name            = "my-iam-role"
  assume_role_policy   = <<EOF
  {
    "Version": "2012-10-17",
    "Statement": [{
      "Effect": "Allow",
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      }
    }]
  }
  EOF
  attached_policies    = ["arn:aws:iam::aws:policy/AdministratorAccess"]
  tags = {
    "Environment" = "Dev"
  }
}
