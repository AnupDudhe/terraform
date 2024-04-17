resource "aws_instance" "this_aws_instance" {
  ami                    = var.this_aws_instance_ami
  instance_type          = var.this_aws_instance_instance_type
  key_name               = var.this_aws_instance_key_name
  vpc_security_group_ids =  [aws_security_group.this_sg.id]
//[var.this_aws_instance_sg_id]
  availability_zone      = var.this_aws_instance_availability_zone
  subnet_id = var.this_aws_instance_subnet 
  root_block_device {
    volume_size = var.this_aws_instance_volume_size
  }
  count = var.this_aws_instance_count
  //user_data_base64 = var.this_aws_instance_user_data_base64
    user_data = <<-EOF
            #!/bin/bash
    sudo -i
    
    EOF 



  tags = {
      
      Name =  var.this_aws_instance_tags
  }
}

resource "aws_security_group" "this_sg" {
  vpc_id = var.this_sg_vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }



}