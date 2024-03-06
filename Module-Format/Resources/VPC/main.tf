
resource "aws_vpc" "this_vpc" {
    cidr_block = var.this_vpc_cidr_block //"12.11.0.0/16"
    tags =  {
        Name = var.this_vpc_tags //"this_vpc"
    }
}

resource "aws_subnet" "this_subnet_pub" {
  vpc_id     = aws_vpc.this_vpc.id  
  cidr_block = var.this_subnet_pub_cidr_block      //"12.11.0.0/17"  
  map_public_ip_on_launch = var.this_subnet_pub_map_ip //true
  tags = {
    Name = var.this_subnet_pub_tags //"pub_subnet"
  }
}
resource "aws_subnet" "this_subnet_private1" {
  vpc_id     = aws_vpc.this_vpc.id
  cidr_block = var.this_subnet_private1_cidr_block   //"12.11.128.0/19"
  map_public_ip_on_launch = var.this_subnet_private_map_ip //false
  tags = {
    Name = var.this_subnet_private1_tags //"pri_subnet1"
  }
}
resource "aws_subnet" "this_subnet_private2" {
  vpc_id     = aws_vpc.this_vpc.id
  map_public_ip_on_launch = var.this_subnet_private_map_ip //false
  cidr_block = var.this_subnet_private2_cidr_block //"12.11.192.0/20"

  tags = {
    Name = var.this_subnet_private2_tags //"pri_subnet2"
  }
}
resource "aws_internet_gateway" "this_igw" {
    vpc_id = aws_vpc.this_vpc.id
    tags = {
        Name = var.this_igw_tags
    }
}

resource "aws_default_route_table" "example" {
  default_route_table_id = aws_vpc.this_vpc.default_route_table_id

  route {
    cidr_block = var.this_def_Route_example_cidr_block //"0.0.0.0/0"
    gateway_id = aws_internet_gateway.this_igw.id
  }

  tags = {
    Name = var.this_def_Route_example_tag //"default"
  }
}

resource "aws_route_table_association" "this_rw_association" {
  subnet_id      = aws_subnet.this_subnet_pub.id
  route_table_id = aws_default_route_table.example.id
}