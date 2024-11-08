this_aws_instance_instance_type = "t2.small"
this_aws_instance_count = 2
this_aws_instance_volume_size = 30
this_aws_instance_tags = {
            Name = "Terraform_instance_via_autotfvars"
            Name2 = "Terraform_instance_b24_via_autotfvars"
            number = 3
       }



#terraform plan -var-file="variables.tfvars"
#terraform apply -var-file="variables.tfvars"
