
output "vpc_subnet_id" {
  value = aws_subnet.prod-subnet-public-1.id
}
output "vpc_id" {
  value = aws_vpc.main.id
}