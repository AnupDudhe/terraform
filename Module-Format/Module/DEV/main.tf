module "vpc" {
    source = "/mnt/c/Users/Anup/Desktop/B24Module/Resources/VPC"
    this_vpc_cidr_block = "12.11.0.0/16"
    this_vpc_tags = "this_vpc"
    this_subnet_pub_cidr_block = "12.11.0.0/17"
    this_subnet_private1_cidr_block =  "12.11.128.0/19"
    this_subnet_pub_map_ip = true
    this_subnet_private_map_ip = false
    this_subnet_pub_tags  = "pub_subnet"
    this_subnet_private1_tags = "pri_subnet1"
    this_subnet_private2_cidr_block = "12.11.192.0/20"
    this_subnet_private2_tags = "pri_subnet2"
    this_igw_tags = "igw"
    this_def_Route_example_cidr_block = "0.0.0.0/0"
    this_def_Route_example_tag = "default" 
}   