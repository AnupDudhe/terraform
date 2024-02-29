resource "aws_iam_user" "this_iam" {
  name = "omkar"
  path = "/"

  tags = {
    name = "student of b24"
  }


}


resource "aws_iam_access_key" "this_iam_key" {
  user = aws_iam_user.this_iam.name
}