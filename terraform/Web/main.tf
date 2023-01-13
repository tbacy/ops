terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}


provider "aws" {
  region = "us-west-2"
}

resource "aws_vpc" "web_vpc" {
  cidr_block = "172.16.0.0/16"

  tags = {
    Name = var.vpc_name
  }
}

resource "aws_subnet" "web_subnet" {
  vpc_id            = aws_vpc.web_vpc.id
  cidr_block        = "172.16.10.0/24"
  availability_zone = "us-west-2"

  tags = {
    Name = var.subnet_name
  }
}

resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic"
  vpc_id      = aws_vpc.main.id

  ingress {
    description      = "TLS from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = [aws_vpc.web_vpc.cidr_block]
    ipv6_cidr_blocks = [aws_vpc.web_vpc.ipv6_cidr_block]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_ssh"
  }
}

resource "aws_network_interface" "web_nic" {
  subnet_id   = aws_subnet.web_subnet.id
  private_ips = ["172.16.10.100"]

  tags = {
    Name = var.nic_name
  }
}

# Create an EC2 instance
resource "aws_instance" "devInstance" {
  ami = "ami-072bfa7f83b597e2b"
  instance_type = var.instance_type
  associate_public_ip_address = true
  
  network_interface {
    network_interface_id = aws_network_interface.web_nic.id
    device_index         = 0
  }

  tags = {
    Name = var.instance_name
  }
}