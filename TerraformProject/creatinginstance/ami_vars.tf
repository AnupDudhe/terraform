variable "aws_instance_ami" {
    type =  string
    default =   "ami-0d2e2d99a673fca16"
}

variable "aws_instance_jenkins_ami" {
    type =  string
    default =   "ami-0e731c8a588258d0d"
}
variable "aws_instance_type" {
    type =  string
    default =   "t2.micro"
}
variable "aws_instance_key" {
    type =  string
    default =  "NVanupDelete"
}
variable "aws_ebs_volume_region" {
        type =  string
        default = "us-east-1a"
}

variable "aws_ebs_volume_size" {
        type =  number
        default = 40
}


variable "aws_instance_count" {
        type =  number
        default =   1


    }

variable "aws_instance_disable_api_termination" {
        type =  bool
        default =  true


    }
variable "aws_instance_map" {
     type = map
     default = {
        name = "for volume"
        name_arn = "created_Via_tf"
     }
}

variable "ec2_id" {
    type = string
    default = "i-0a4c9c29c16ad6c08"
  
}


   variable "aws_instance_all_parameters" {
        type =  any
        default =  {
            a =  "10.0.0.0/16"
            b =  1
            c =  true
            d =  ["subnet-0f3df99cfc27c92c8","subnet-000c3293ab86e944f","subnet-0043f2a495befa536"]


        }


    }


    variable "aws_vpc" {
    type =  string
    default =   "10.0.0.0/16"


}