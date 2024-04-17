   
resource "aws_vpc" "this_vpc" {
  cidr_block = var.this_vpc_cidr_block //"192.168.0.0/16"
  tags = {
    Name = var.this_vpc_cidr_tags //"vpc"
  }
}
resource "aws_subnet" "this_public" {
  vpc_id     = aws_vpc.this_vpc.id
  cidr_block = var.this_public_cidr_block //"192.168.0.0/17"
       // = default_route_table_id'
  map_public_ip_on_launch = var.this_public_map_pub //true
  tags = {
    Name = var.this_public_tags
  }
}
resource "aws_subnet" "this_private1" {
  vpc_id     = aws_vpc.this_vpc.id
  cidr_block = var.this_private1_cidr_block //"192.168.128.0/19"
  map_public_ip_on_launch = var.this_private_map_pub //false
  tags = {
    Name = var.this_private_tags //"private_subnet_1"
  }
}
resource "aws_subnet" "this_private2" {
  vpc_id     = aws_vpc.this_vpc.id
  map_public_ip_on_launch = var.this_private_map_pub  //false
  cidr_block = var.this_private2_cidr_block //"192.168.192.0/20"

  tags = {
    Name = var.this_private_tags2 //"private_subnet_2"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.this_vpc.id 
  tags = {
    Name = var.this_gw //"main"
  }
}
/* resource "aws_internet_gateway_attachment" "example" {
  internet_gateway_id = aws_internet_gateway.gw.id
  vpc_id              = aws_vpc.this_vpc.id
} */
/* resource "aws_route" "this_aws_route" {
  route_table_id            =  aws_vpc.this_vpc.default_route_table
  gateway_id = aws_internet_gateway.gw.id
  destination_cidr_block    = "0.0.0.0/0"
  depends_on = [aws_vpc.this_vpc]
} */
resource "aws_default_route_table" "this_rt" {
  default_route_table_id = aws_vpc.this_vpc.default_route_table_id
  route {
    cidr_block = var.this_rt_cidr_block //"0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
    }

  tags = {
    Name = var.this_rt_tag
  }
}
resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.this_public.id
  route_table_id = aws_default_route_table.this_rt.id
  depends_on = [aws_vpc.this_vpc]
}