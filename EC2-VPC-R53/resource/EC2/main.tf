resource "aws_instance" "this" {
  ami                     = var.aws_instance_this_ami
  instance_type           = var.aws_instance_this_instance_type
  vpc_security_group_ids =         [aws_security_group.web_server.id]  
  subnet_id = var.aws_instance_this_subnet_id
  key_name = var.aws_instance_this_key_pair
  associate_public_ip_address = var.aws_instance_this_pub
    
    user_data = <<-EOF
      #!/bin/sh
      sudo -i
      systemctl start nginx
      systemctl enable nginx
      systemctl start mariadb
      systemctl enable mariadb
      bash /root/apache-tomcat-8.5.97/bin/catalina.sh start
      EOF
}

#need tweaking in below code snippet !!!! 
resource "aws_security_group" "web_server" {
  #name        = var.ec2_security_group_name
  #description = var.ec2_security_group_description
  vpc_id      = var.ec2_vpc_id
 
  ingress {
    description      = "Allow traffic on port 80 from everywhere"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
   ingress {
    description      = "Allow traffic on port 80 from everywhere"
    from_port        = 8080
    to_port          = 8080
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
    ingress {
    description      = "Allow traffic on port 80 from everywhere"
    from_port        = 3306
    to_port          = 3306
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
 
  tags = {
    Name = "terra"
  }
}
