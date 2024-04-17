provider "aws" {
        region = "us-west-2"
        shared_credentials_files = ["/home/anup/.aws/credentials"]
        profile = "configs"
}
terraform {
    backend  "s3" {
              bucket = "cbzbatch24"
              dynamodb_table = "terraform-state-lock"
              key = "terraform.tfstate"
              region = "us-west-2"
              profile = "configs"
              shared_credentials_files = ["/home/anup/.aws/credentials"]
        }
    
}