/*  provider "aws" {
    region = "us-west-2"
    profile = "configs"
     access_key = ""
    secret_key = "" 
    shared_credentials_file = "~/.aws/credentials"

}  */
 
/* terraform {
    backend "s3" {
            bucket = "batch24bucketeee"
            key = "my-terra-project"
            region = "us-west-2"
            //shared_credentials_file = "~/.aws/credentials"
    
    dynamodb_table = "b24dynamo"
    encrypt = true
    }
} */


/* resource "aws_s3_bucket" "this_s3_bucket" {
    bucket = "batch24bucketeee"
    lifecycle {
      prevent_destroy = true 
    }

    versioning {
      enabled = true
    }

    server_side_encryption_configuration {
         rule {
            apply_server_side_encryption_by_default {
             sse_algorithm = "AES256"
            }
        }
    }
   
}
   */

/* resource "aws_dynamodb_table" "this_dynamodb_table" {
    name = "b24dynamo"
    billing_mode = "PAY_PER_REQUEST"
    hash_key = "LockID"

    attribute {
        name = "LockID"
        type = "S"
    }    
}
 */ 