#adding 2 users in 1 group

resource "aws_iam_group" "terragroup" {
  name = "t_group"
  path = "/"
}

resource "aws_iam_user_group_membership" "example2" {
  user = aws_iam_user.user1.name
  groups = [
    aws_iam_group.terragroup.name
  ]
}

resource "aws_iam_user_group_membership" "example3" {
  user = aws_iam_user.user2.name
  groups = [
    aws_iam_group.terragroup.name
  ]
}


