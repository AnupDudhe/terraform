provider "aws" {
    region =  "us-west-2"
    access_key = ""
    secret_key = ""
    //profile = "configs"
}
 resource "aws_instance" "this_aws_instance" {
    ami = "ami-0eb5115914ccc4bc2"
    vpc_security_group_ids = ["sg-081787a4571bd9c08"]
    key_name = "anup_delete"
    instance_type = "t2.micro"
     
     provisioner "file" {
    source      = "readme.md"
    destination = "/home/ec2-user/readme.md"
      connection {
    type     = "ssh"
    user     = "ec2-user"
    private_key = file("${path.module}/id_rsa")
    host     = "${self.public_ip}"
  }
  
  
  }
   provisioner "local-exec" {
    command = "echo ${self.private_ip} >> /tmp/private_ips.txt "
  }
    provisioner "local-exec" {
    working_dir = "/tmp/"
    command = "echo ${self.private_ip} >> workingdir_private_ips.txt "
  }


}
  
  
  
  
 