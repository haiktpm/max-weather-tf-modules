output "subnet_id" {
  description = "The ID of the created subnet"
  value       = aws_subnet.this.id
}

output "subnet_arn" {
  description = "The ARN of the created subnet"
  value       = aws_subnet.this.arn
}
