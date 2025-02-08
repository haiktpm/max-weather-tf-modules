resource "aws_iam_policy" "this" {
  name        = var.policy_name
  description = var.policy_description
  policy      = var.policy_document

  tags = var.tags
}

# Optionally attach the policy to an IAM role
resource "aws_iam_policy_attachment" "this" {
  count      = length(var.attached_roles)
  name       = "${var.policy_name}-attachment"
  policy_arn = aws_iam_policy.this.arn
  roles      = [var.attached_roles[count.index]]
}
