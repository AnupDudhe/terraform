

directory:     dev/main.tf
module "dev_ec2" {
  source = "../../resource/ec2"
  instance_ami = "ami-06aa3f7caf3a30282"
  instance_key = "delete"
  instance_type = "t2.micro"
  instance_subnet = module.dev_vpc.vpc_subnet_id
}

module "dev_vpc" {
  source = "../../resource/vpc"
  vpc_cidr = "20.20.0.0/18"
  vpc_subnet_cidr = "20.20.0.0/20"
}

directory:     ec2/main.tf
resource "aws_instance" "foo" {
  ami = var.instance_ami
  instance_type = var.instance_type
    key_name = var.instance_key
    subnet_id =  var.instance_subnet
}

directory:     ec2/var.tf
variable  "instance_ami" {
    type = string
}

variable  "instance_type" {
    type = string
}

variable  "instance_key" {
    type = string
}

variable  "instance_subnet" {
    type = string
}

directory:     vpc/output.tf
output "vpc_subnet_id" {
  value = aws_subnet.main.id
}

directory:     vpc/main.tf

resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr 
   tags = {
    Name = "vpc_1"
  }     
}

resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.vpc_subnet_cidr

  tags = {
    Name = "subnet_1"
  }
}

directory:     vpc/var.tf

variable "vpc_cidr" {
  type = string
}

variable "vpc_subnet_cidr" {
  type = string
}