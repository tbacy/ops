resource "aws_vpc" "net1_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = var.vpc_name
  }
}

resource "aws_subnet" "net1_subnet" {
  vpc_id     = aws_vpc.net1_vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = var.subnet_name
  }
}

resource "aws_route_table" "net1_route_table" {
  vpc_id = aws_vpc.net1_vpc.id

  route {
    cidr_block = var.ip4_route
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = var.route_table_name
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.net1_vpc.id

  tags = {
    Name = var.igw_name
  }
}