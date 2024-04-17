#created a vpc
resource "aws_vpc" "main" {
  cidr_block = var.aws_vpc_main_cidr_block
   

}
#created a public subnet
resource "aws_subnet" "prod-subnet-public-1" {
    vpc_id = aws_vpc.main.id
    cidr_block = var.aws_subnet_prod-subnet-public-1_cidr_block
    #map_public_ip_on_launch = var.aws_subnet_prod-subnet-public-1_map_public_ip_on_launch //it makes this a public subnet
    availability_zone = var.aws_subnet_prod-subnet-public-1_availability_zone
     

}

#created a private subnet
resource "aws_subnet" "prod-subnet-private-2" {
    vpc_id = aws_vpc.main.id
    cidr_block = var.aws_subnet_prod-subnet-private-2_cidr_block
    #map_public_ip_on_launch = var.aws_subnet_prod-subnet-public-1_map_public_ip_on_launch //it makes this a public subnet
    availability_zone = var.aws_subnet_prod-subnet-private-2_availability_zone
     

}
# Create Public Route Table and add IG Route
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = var.aws_route_table_public_route_table
    gateway_id = aws_internet_gateway.internet_gateway.id
  }

  tags = {
    Name = "Public Route Table"
  }
}

# # Create Private Route Table  and add NAT Route
# resource "aws_route_table" "private_route_table" {
#   vpc_id = aws_vpc.main.id

#   route {
#     cidr_block = var.aws_subnet_prod-subnet-private-2_cidr_block
#     #nat_gateway_id = aws_nat_gateway.example.id
#   }

#   tags = {
#     Name = "Private Route Table"
#   }
# }
# #associating aws route table with private subnet
# resource "aws_route_table_association" "Private_route_table" {
#   subnet_id      = aws_subnet.prod-subnet-private-2.id
#   route_table_id = aws_route_table.private_route_table.id
# }

#associating aws route table with public subnet
resource "aws_route_table_association" "Public_route_table" {
  subnet_id      = aws_subnet.prod-subnet-public-1.id
  route_table_id = aws_route_table.public_route_table.id
}


#created a internet gateway and attached it to VPC
resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "terraform-ig"
  }
}
# #created a elastic ip
# resource "aws_eip" "Nat-Gateway-EIP" {
#   depends_on = [
#     aws_route_table_association.Private_route_table
#   ]
#   #vpc = true
# }

# #creating a nat gateway 

#  resource "aws_nat_gateway" "example" {
#    #connectivity_type = var.aws_nat_gateway_example_connectivity_type
#     subnet_id         = aws_subnet.prod-subnet-public-1.id
# #   allocation_id = aws_eip.Nat-Gateway-EIP.id
#  }


 


