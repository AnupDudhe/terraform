resource "aws_instance" "this_aws_instance" {
        ami = data.aws_ami.this_aws_ami.id
        instance_type = "t2.small"
        key_name = "anupdel"
        vpc_security_group_ids = ["sg-02582bf615cdb71bb", aws_security_group.this_sg.id]
        availability_zone = "us-west-2a"
        root_block_device {
            volume_size = 15
        }
        user_data_base64 = true
         
        tags = {
            Name = "Terraform_instance" 
        }
}


resource "aws_security_group" "this_sg" {
      ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "TCP"
    cidr_blocks      = ["0.0.0.0/0"]
  }
    ingress {
    from_port        = 8080
    to_port          = 8080
    protocol         = "TCP"
    cidr_blocks      = ["0.0.0.0/0"]
  }
    ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "TCP"
    cidr_blocks      = ["0.0.0.0/0"]
  } 
    ingress {
    from_port        = 3306
    to_port          = 3306
    protocol         = "TCP"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  

  
}

data "aws_ami" "this_aws_ami" {

     name_regex       = "ami_use"
     owners =  ["self"]

     filter {
       name = "name"
       values = ["ami_use"]
     }


}




resource "aws_db_instance" "this_aws_db" {
    instance_class = "db.t2.micro"
    //db_subnet_group_name = "subnet-0c376428f24e53d51"
    vpc_security_group_ids = ["sg-02582bf615cdb71bb", aws_security_group.this_sg.id]
    engine = "mysql"
    username = "admin"
    password = "12345678911"
    allocated_storage = 10
    storage_type = "gp2"
}

output "public_ip" {
  value = aws_instance.this_aws_instance.public_ip
  
}

