resource "aws_vpc" "vpc1" {
    cidr_block = var.aws_vpc

    tags = {
      "Three-tier" = "vpc_studentwar" 
    }
}