resource "aws_instance" "this_aws_instance" {
  ami                    = data.aws_ami.this_aws_ami.id
  instance_type          = var.this_aws_instance_instance_type
  key_name               = var.this_aws_instance_key_name
  vpc_security_group_ids = ["sg-02582bf615cdb71bb", aws_security_group.this_sg.id]
  availability_zone      = var.this_aws_instance_availability_zone
  root_block_device {
    volume_size = var.this_aws_instance_volume_size
  }
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


resource "aws_security_group" "this_sg" {
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



data "aws_ami" "this_aws_ami" {

  name_regex = "ami_use"
  owners     = ["self"]

  filter {
    name   = "name"
    values = ["ami_use"]
  }


}

/* output "aws_public_ip" {
  value = aws_instance.this_aws_instance.public_ip

}
output "aws_instance_id" {

  value = aws_instance.this_aws_instance.id

}

output "aws_instance_state" {

  value = aws_instance.this_aws_instance.instance_state

} */



resource "aws_db_instance" "this_aws_db" {
  instance_class = "db.t2.micro"
  //db_subnet_group_name = "rds-ec2-db-subnet-group-1"
  vpc_security_group_ids = ["sg-02582bf615cdb71bb", aws_security_group.this_sg.id]
  engine                 = "mysql"
  username               = "admin"
  password               = "12345678911"
  allocated_storage      = 10
  storage_type           = "gp2"
}



resource "aws_iam_user" "this_iam_user" {
    name = "terraform"
    path = "/"

    tags = {
    name = "test"
  }
}

resource "aws_iam_policy_attachment" "this_aws_iam_poli" {
       name = "test-attachment"
       policy_arn = aws_iam_policy.policy.arn
       users      = [aws_iam_user.this_iam_user.name]
       depends_on = [aws_iam_policy.policy] #explicity or implicit
  
}


resource "aws_iam_policy" "policy" {
  name        = "new_policy"
  path        = "/"
  description = "My test policy"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "ec2:Describe*",
          "s3:FullAccess",
          "ec2:CreateKeyPair",
          "ec2:AttachVolume"
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
} 