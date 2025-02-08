resource "aws_iam_role" "this" {
  name               = var.role_name
  assume_role_policy = var.assume_role_policy

  tags = var.tags
}

# Optionally attach policies to the IAM Role
resource "aws_iam_role_policy_attachment" "this" {
  count      = length(var.attached_policies)
  role       = aws_iam_role.this.name
  policy_arn = var.attached_policies[count.index]
}
