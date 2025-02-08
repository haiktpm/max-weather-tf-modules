# Create the Internet Gateway
resource "aws_internet_gateway" "this" {
  vpc_id = var.vpc_id

  tags = merge(
    {
      Name = var.igw_name
    },
    var.tags
  )
}
