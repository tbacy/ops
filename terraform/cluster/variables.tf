variable "vpc_name" {
    description = "Your vpc name"
    type = string
    default = "cluster_vpc"
  
}

variable "igw_name" {
    description = "Internet Gateway Name"
    type = string
    default = "cluster_igw"
  
}

variable "ip4_route" {
    description = "ipv4 route IP"
    type = string
    default = "0.0.0.0/0"
  
}

variable "route_table_name" {
    description = "Route Table Name"
    type = string
    default = "cluster_rt"
  
}

variable "subnet_name" {
    description = "Subnet name"
    type = string
    default = "cluster_subnet"
  
}