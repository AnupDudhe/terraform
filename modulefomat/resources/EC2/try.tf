/* provider "aws" {
    region = var.region
}

data "aws_security_group" "server_sg" {
    name = "default"
}

#resources
resource "aws_instance" "server-1" {
    ami = var.ami
    instance_type = var.instance_type
    key_name = var.key_name
    vpc_security_group_ids = [data.aws_security_group.server_sg.id]
    tags = var.tags
}

# variables
variable "region" {
    default = "us-east-2"
    description = "providing region for demo"
}

variable "ami" {
    default = "ami-0f5daaa3a7fb3378b"
    description = "providing ami for demo"
}

variable "instance_type" {
    default = "t2.micro"
    description = "providing instance type for server size"
}

variable "key_name" {
    default = "windows_global_key"
    description = "providing the key-pair for demo"
}

variable "tags" {
    type = map
    default = {
    Name = "Development-server"
    Enviorment = "staging"
    Owner = "jarvis"
    }
}

#output block
output "demo" {
    value = data.aws_security_group.server_sg.id
}

## try to run using 
    # terraform output */