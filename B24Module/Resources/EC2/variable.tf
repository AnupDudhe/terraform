
variable "this_sg_vpc_id" {
   type = string
}

variable "this_aws_instance_instance_type" {
       type = string
       //default = "t2.micro"
}
variable "this_aws_instance_ami" {
      type = string
}

variable "this_aws_instance_subnet" {
     type = string
}
variable "this_aws_instance_key_name" {
       type = string
       //default = "anupdel"
}
variable "this_aws_instance_availability_zone" {
       type = string
       //default = "us-west-2a"
}

variable "this_aws_instance_volume_size" {
       type = number 
       //default = 15
}
variable "this_aws_instance_count" {
       type = number 
       //default = 3
} 
variable "this_aws_instance_user_data_base64" {
       type = bool
       //default = true
}

variable "this_aws_instance_tags" {
       type = string
}
/* variable "this_aws_instance_sg_id" {
    type = string
} */

/* variable "this_aws_vpc_id" {
    type = string
} */