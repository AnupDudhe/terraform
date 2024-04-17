resource "aws_instance" "this" {
  ami             = var.aws_instance_ami
  instance_type   = var.aws_instance_type
  key_name        = var.aws_instance_key
  security_groups = ["sg-0e0c5e2ada8c28466"]
  subnet_id       = var.aws_instance_all_parameters.d[0]
  disable_api_termination = var.aws_instance_disable_api_termination
  count = var.aws_instance_count
  user_data = <<-EOF
      #!/bin/sh
      sudo -i
      systemctl start nginx
      systemctl enable nginx
      systemctl start mariadb
      systemctl enable mariadb
      bash /root/apache-tomcat-8.5.97/bin/catalina.sh start
      EOF

  


  tags = {
    purpose = "demo purposes"
  }  
}
