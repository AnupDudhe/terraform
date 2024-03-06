variable "this_vpc_cidr_block" {
     type = string
}
variable "this_vpc_tags" {
     type = string
}
variable "this_subnet_pub_cidr_block" {
     type = string
}

variable "this_subnet_pub_map_ip" {
    type = bool
}
variable "this_subnet_pub_tags" {
    type = string
}
variable "this_subnet_private1_cidr_block" {
    type = string
}
variable "this_subnet_private_map_ip" {
    type = bool
}

variable "this_subnet_private1_tags" {
    type = string
} 

variable "this_subnet_private2_cidr_block" {
   type = string
}

variable "this_subnet_private2_tags" {
    type = string
} 
variable "this_igw_tags" {
    type = string
} 

variable "this_def_Route_example_cidr_block" {
   type = string
}
variable "this_def_Route_example_tag" {
   type = string
}
