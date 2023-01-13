variable "instance_name" {
    description = "Instance Name"
    type = string
    default = "devDefaultInstance"
  
}

variable "instance_type" {
    description = "Instance Type"
    type = string
    default = "t2.micro"
  
}

variable "vpc_name" {
    description = "VPC Name"
    type = string
    default = "webVPC"
  
}

variable "subnet_name" {
    description = "Subnet Name"
    type = string
    default = "webSubnet"
  
}

variable "nic_name" {
    description = "Name of Network Interface Card"
    type = string
    default = "webNIC"
  
}

#Open port

variable "service_port_number" {
    description = "Port for server service"
    type = number
    default = 8080
  
}

variable "ssh_port" {
    description = "ssh port"
    type = number
    default = 22
  
}