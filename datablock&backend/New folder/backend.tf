provider "aws" {
      region = "us-west-2"
      profile = "user1"
      shared_credentials_files = ["/home/anup/.aws/credentials"]
    
}


terraform {
    backend "s3" {
        bucket = "cbzbatch24"
        key = "terraform.tfstate"
        dynamodb_table = "cbz24"
        region = "us-west-2"
        profile = "user1"
        shared_credentials_files = ["/home/anup/.aws/credentials"]
    }
}


resource "aws_instance" "ths_instance" {
  ami = "ami-052c9ea013e6e3567"
  key_name = "anupdel"
  instance_type = "t2.small"
  //security_groups = ["sg-02582bf615cdb71bb"]
  count = 1
  
  
  user_data = <<-EOF
    #!/bin/bash
    sudo apt-get update
    sudo apt-get install -y apache2
    sudo echo "hello world this is Batc24" >> /var/www/html/index.html
    EOF
   tags = {
    Name = "first_terraform_instance"

  } 
    
}
