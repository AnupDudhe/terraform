resource "aws_security_group" "main" {
    name        = "EC2-webserver-SG-1"
    description = "Webserver for EC2 Instances"

  ingress {
        from_port = 80 
        to_port = 88
        protocol = "TCP"
        cidr_blocks      = ["0.0.0.0/0"]
        #ipv6_cidr_blocks = ["::/0"] 
        }    
    ingress {
        from_port = 8080 
        to_port = 8080
        protocol = "TCP"
        cidr_blocks      = ["0.0.0.0/0"]
        #ipv6_cidr_blocks = ["::/0"] 
        }    
      ingress {
        from_port = 3306
        to_port = 3306
        protocol = "TCP"
        cidr_blocks      = ["0.0.0.0/0"]
        #ipv6_cidr_blocks = ["::/0"] 
        }  

  ingress {
        from_port = 443
        to_port = 443
        protocol = "TCP"
        cidr_blocks      = ["0.0.0.0/0"]
        #ipv6_cidr_blocks = ["::/0"] 
        }  
   


   egress {
    from_port       = 0
    to_port = 0
    protocol        = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
}