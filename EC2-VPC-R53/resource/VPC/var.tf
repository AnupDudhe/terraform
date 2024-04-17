variable "aws_vpc_main_cidr_block" {
    type = string
}

variable "aws_subnet_prod-subnet-public-1_cidr_block" {
  type = string
}

variable "aws_subnet_prod-subnet-private-2_cidr_block" {
  type = string
  
}
variable "aws_subnet_prod-subnet-public-1_map_public_ip_on_launch" {
  type = bool
}

variable "aws_subnet_prod-subnet-public-1_availability_zone" {
  type = string
}

variable "aws_subnet_prod-subnet-private-2_availability_zone" {
  type = string 
}

variable "aws_route_table_public_route_table" {
  type = string
}

# variable "ec2_security_group_name" {
#   type = string
# }


