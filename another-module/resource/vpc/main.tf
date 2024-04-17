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