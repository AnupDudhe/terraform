resource "aws_instance" "foo" {
  ami = var.instance_ami
  instance_type = var.instance_type
    key_name = var.instance_key
    subnet_id =  var.instance_subnet
}