resource "aws_instance" "this_jenkins_server" {
  ami             = var.aws_instance_ami
  instance_type   = var.aws_instance_type
  key_name        = var.aws_instance_key
  security_groups = [aws_security_group.main.id]
  subnet_id       = var.aws_instance_all_parameters.d[0]
  disable_api_termination = var.aws_instance_disable_api_termination
  count = var.aws_instance_count
  user_data = <<-EOF
    #!/bin/sh
    sudo -i
    sudo wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat/jenkins.repo
    sudo rpm --import https://pkg.jenkins.io/redhat/jenkins.io-2023.key
    sudo yum upgrade
    # Add required dependencies for the jenkins package
    sudo yum install fontconfig java-17-openjdk -y
    sudo yum install jenkins -y
    sudo yum install java -y
    systemctl start jenkins
    EOF

  


  tags = {
    purpose = "jenkins server"
  }  
}
