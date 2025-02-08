# AWS IAM Policy Module

This module creates an IAM policy with the option to attach it to IAM roles.

## Usage

```hcl
module "iam_policy" {
  source              = "./aws-iam-policy-module"
  policy_name         = "MyCustomPolicy"
  policy_description  = "A custom policy for specific actions"
  policy_document     = <<EOF
  {
    "Version": "2012-10-17",
    "Statement": [
      {
        "Effect": "Allow",
        "Action": "s3:ListBucket",
        "Resource": "arn:aws:s3:::my-bucket"
      }
    ]
  }
  EOF
  attached_roles      = ["role-1", "role-2"]
  tags = {
    "Environment" = "Dev"
  }
}
