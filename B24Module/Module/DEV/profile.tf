provider "aws" {
        region = "us-west-2"
        //shared_credentials_files = ["/home/anup/.aws/credentials"]
        profile = "configs"
        default_tags {
            tags = {
              name = "aws"
            }
    

}
}
/* }
 terraform {
    backend  "s3" {
              bucket = "cbzbatch24"
              dynamodb_table = "terraform.tfstate"
              key = "terraformproject"
              region = "us-west-2"
              profile = "configs"
              shared_credentials_files = ["/home/anup/.aws/credentials"]
        }
    
}  */ 