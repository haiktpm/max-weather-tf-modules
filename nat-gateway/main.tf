# Allocate an Elastic IP for the NAT Gateway
resource "aws_eip" "nat" {
  tags = merge(
    {
      Name = var.nat_gateway_name
    },
    var.tags
  )
}

# Create the NAT Gateway
resource "aws_nat_gateway" "this" {
  allocation_id = aws_eip.nat.id
  subnet_id     = var.subnet_id

  tags = merge(
    {
      Name = var.nat_gateway_name
    },
    var.tags
  )

  depends_on = [aws_eip.nat]
}