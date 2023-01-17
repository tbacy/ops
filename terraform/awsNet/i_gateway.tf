resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.net1.id

  tags = {
    Name = var.igw_name
  }
}