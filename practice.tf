#creating bucket
resource "aws_s3_bucket"  "this_sb" {
        bucket = "terraformbasedbucket"
        object_lock_enabled = true
        force_destroy = true
        tags = {
                Name        = "My bucket"
                Environment = "Dev"
    }
}
/* 
resource "aws_s3_bucket_acl" "example" {
  bucket = aws_s3_bucket.this_sb.id
  acl    = "private"
}

resource "aws_s3_bucket_versioning" "this_s3_versioning" {
     depends_on = [ aws_db_instance.this_aws_db.object_lock_enabled, aws_db_instance.this_aws_db]
     bucket = aws_s3_bucket.this_sb.id
     versioning_configuration {
       status = "Enabled" 
     }
} */