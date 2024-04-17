variable "aws_instance_this_ami" {
    type = string
}

variable "aws_instance_this_instance_type" {
    type = string
}

variable "aws_instance_this_pub" {
    type = bool
  
}

variable "aws_instance_this_key_pair" {
    type = string
}
#variable "aws_instance_this_security_groups" {
    #type = string
#}

variable "aws_instance_this_subnet_id" {
  type = string
}
variable "ec2_vpc_id" {
  type = string
}
# variable "ec2_security_group_name" {
#   type = string
# }


