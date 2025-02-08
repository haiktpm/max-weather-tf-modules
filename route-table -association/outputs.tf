output "associations" {
  description = "List of route table association IDs"
  value       = aws_route_table_association.this[*].id
}
