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

# Create an EC2 instance
resource "aws_instance" "devInstance" {
  ami = "ami-072bfa7f83b597e2b"
  instance_type = var.instance_type

  tags = {
    Name = var.instance_name
  }
}