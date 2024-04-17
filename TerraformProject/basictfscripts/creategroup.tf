#adding 1 users in 1 group

resource "aws_iam_group" "developers" {
  name = "terraform_group"
  path = "/"
}

resource "aws_iam_user_group_membership" "example1" {
  user = aws_iam_user.lb.name

  groups = [
    aws_iam_group.developers.name
  ]
}



