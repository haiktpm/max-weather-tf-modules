resource "aws_route_table" "this" {
  vpc_id = var.vpc_id

  tags = merge(
    { "Name" = var.route_table_name },
    var.tags
  )
}

# Create routes dynamically
resource "aws_route" "this" {
  count = length(var.routes)

  route_table_id         = aws_route_table.this.id
  destination_cidr_block = var.routes[count.index].destination_cidr_block
  gateway_id             = lookup(var.routes[count.index], "gateway_id", null)
  nat_gateway_id         = lookup(var.routes[count.index], "nat_gateway_id", null)
  network_interface_id   = lookup(var.routes[count.index], "network_interface_id", null)
  transit_gateway_id     = lookup(var.routes[count.index], "transit_gateway_id", null)
  vpc_peering_connection_id = lookup(var.routes[count.index], "vpc_peering_connection_id", null)
}

# Associate route table with subnets
resource "aws_route_table_association" "this" {
  count          = length(var.subnet_ids)
  subnet_id      = var.subnet_ids[count.index]
  route_table_id = aws_route_table.this.id
}
