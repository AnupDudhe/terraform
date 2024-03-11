provider "aws" {
    region =  "us-west-2"
    access_key = "
    secret_key = ""
    //profile = "configs"
}
 
 resource "aws_instance" "this_aws_instance" {
    for_each = toset(var.aws_ami)
    ami = each.value
    vpc_security_group_ids = ["sg-081787a4571bd9c08"]
    key_name = "anup_delete"
    instance_type = "t2.micro"
    
}   
variable "aws_ami" {
    type = list(string)
    default =  ["ami-0eb5115914ccc4bc2","ami-08f7912c15ca96832","ami-0f7197c592205b389","ami-011fa029a966edf23"]
} 
resource "aws_iam_user" "main_user1" {
    name =  var.aws_user_name[count.index]
    count = length(var.aws_user_name)
}

 variable "aws_user_name" {
    type = list(string)
    default =  ["ubuntu","centos","mintos","solaris"]
} 


output "aws_public_ip" {
    value = [for instance in var.aws_ami:
    aws_instance.this_aws_instance[instance].public_ip]
}
