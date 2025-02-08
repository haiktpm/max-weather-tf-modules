output "nat_gateway_id" {
  description = "The ID of the NAT Gateway"
  value       = aws_nat_gateway.this.id
}

output "eip" {
  description = "The Elastic IP assigned to the NAT Gateway"
  value       = aws_eip.nat.public_ip
}