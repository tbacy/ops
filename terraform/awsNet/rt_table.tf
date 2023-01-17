resource "aws_route_table" "net1_route_table" {
  vpc_id = aws_vpc.net1.id

  route {
    cidr_block = var.ip4_route
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = var.route_table_name
  }
}