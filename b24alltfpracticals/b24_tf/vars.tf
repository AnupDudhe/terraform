variable "this_aws_instance_instance_type" {
       type = string
       default = "t2.micro"
}
variable "this_aws_instance_key_name" {
       type = string
       default = "anupdel"
}
variable "this_aws_instance_availability_zone" {
       type = string
       default = "us-west-2a"
}

variable "this_aws_instance_volume_size" {
       type = number 
       default = 15
}
variable "this_aws_instance_count" {
       type = number 
       default = 3
}
variable "this_aws_instance_user_data_base64" {
       type = bool
       default = true
}

variable "this_aws_instance_tags" {
       type = map 
       default = {
            Name = "Terraform_instance"
            Name2 = "Terraform_instance_b24"
            number = 2
       }
  
}


variable "this_aws_iam_user_users" {
    type = list 
    default = ["adarsh","omkar","shruti","yash"] 
                 
} 

variable "this_aws_iam_user_path" {
    type = string
    default = "/"
}

variable "this_aws_iam_user_path_tejas" {
  type = any
  default = {
    a = ["anup" , "omkar" ,"varsharani" ]
    b = {
       b1 = "anup"
       b2 = "omkar"
    }
    c = "/"
    d = 9
    e = true
  }

  }
