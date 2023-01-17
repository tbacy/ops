variable "vpc_name" {
    description = "Your vpc name"
    type = string
    default = "tf_vpc"
  
}

variable "igw_name" {
    description = "Internet Gateway Name"
    type = string
    default = "tf_igw"
  
}

variable "ip4_route" {
    description = "ipv4 route IP"
    type = string
    default = "0.0.0.0/0"
  
}

variable "route_table_name" {
    description = "Route Table Name"
    type = string
    default = "tf_rt"
  
}