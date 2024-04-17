resource "aws_instance" "this_aws_instance" {
  ami                    = data.aws_ami.this_aws_ami.id
  instance_type          = var.this_aws_instance_instance_type
  key_name               = var.this_aws_instance_key_name
  vpc_security_group_ids = [var.this_aws_instance_vpc_security_group_ids] //[aws_security_group.this_sg.id]
  availability_zone      = var.this_aws_instance_availability_zone
  /* root_block_device {
    volume_size = var.this_aws_instance_volume_size
  } */
  count = var.this_aws_instance_count
  //user_data_base64 = var.this_aws_instance_user_data_base64
    user_data = <<-EOF
            #!/bin/bash
    sudo -i
    sudo yum update –y
    sudo wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo
    sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
    sudo yum upgrade
    # Add required dependencies for the jenkins package
    sudo dnf install java-17-amazon-corretto -y
    sudo yum install jenkins -y
    sudo systemctl enable jenkins
    systemctl start jenkins
    EOF 



  tags = {
      Name =  var.this_aws_instance_tags.Name
      batch =  var.this_aws_instance_tags.Name2
      strength = var.this_aws_instance_tags.number
  }
}



data "aws_ami" "this_aws_ami" {

  name_regex = "ami_use"
  owners     = ["self"]

  filter {
    name   = "name"
    values = ["ami_use"]
  }


}