module "aws_vpc" {
    source = "/mnt/c/Users/Anup/Desktop/terraform16/resources/VPC"
    this_vpc_cidr_block = "192.168.0.0/16"
    this_vpc_cidr_tags = "vpc"
    this_public_cidr_block  = "192.168.0.0/17"
    this_public_map_pub = true
    this_public_tags = "public"
    this_private1_cidr_block = "192.168.128.0/19"  
    this_private2_cidr_block = "192.168.192.0/20"
    this_private_map_pub = false
    this_private_tags = "private_subnet_1"
    this_private_tags2 = "private_subnet_2"
    this_gw = "main"
    this_rt_cidr_block = "0.0.0.0/0"
    this_rt_tag = "default_rt"



}   

module "aws_ec2" {
    source = "/mnt/c/Users/Anup/Desktop/terraform16/resources/EC2"
    this_aws_instance_ami = "ami-041c2a757e0cd00ca"
    this_aws_instance_instance_type  = "t2.micro"
    this_aws_instance_subnet = module.aws_vpc.aws_subnet_this_public
    this_aws_instance_key_name = "anupdel"
    this_aws_instance_availability_zone = "us-west-2b"
    this_aws_instance_volume_size = 15
    this_aws_instance_count = 1
    this_aws_instance_user_data_base64 = true
    this_aws_instance_tags =  "Terraform_instance"
    //this_aws_instance_sg_id = "sg-02582bf615cdb71bb"
    this_aws_vpc_id = module.aws_vpc.aws_vpc_id
}