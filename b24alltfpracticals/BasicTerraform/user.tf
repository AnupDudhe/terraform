resource "aws_iam_user" "this" {
  name = "b24"
  path = "/"

  tags = {
    Name = "this is for b24"
  }

}
resource "aws_iam_access_key" "this" {
  user = aws_iam_user.this.name
}

/* resource "aws_iam_policy" "this" {
   policy = 
   name = "full_access"
   user = "aws_iam_user.this"
} */


resource "aws_iam_policy_attachment" "this" {
  name       = "full_access"
  users      = [aws_iam_user.this.name]
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

resource "aws_iam_group_membership" "team" {
  name = "tf-testing-group-membership"

  users = [
    aws_iam_user.this.name
  ]

  group = aws_iam_group.this.name
}


resource "aws_iam_group" "this" {
  name = "unlimited_learning"
  path = "/"
}


