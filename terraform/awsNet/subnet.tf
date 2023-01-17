resource "aws_subnet" "net1_subnet" {
  vpc_id     = aws_vpc.net1.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = var.subnet_name
  }
}