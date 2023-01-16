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

# Resources

module "vpc" {
    source = "terraform-aws-modules/vpc/aws"

    name = "dev-vpc"
    cidr = var.vpc_cidr_range

    azs = slice(data.aws_availability_zones.azs.names, 0, 2)
    public_subnets = var.public_subnets

    # Database subnets
    database_subnets = var.database_subnets
    database_subnet_group_tags = {
        subnet_type = "database"
    }

    tags = {
        Environment = "dev"
        Team        = "infra"
    }
  
}


# Outputs

output "vpc_id" {
    value = module.vpc.vpc_id

}

output "db_subnet_group" {
    value = module.vpc.database_subnet_group
  
}

output "public_subnets" {
    value = module.vpc.public_subnets
  
}