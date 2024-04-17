resource "aws_iam_user" "user1" {
  name = "TerraUser1"
  path = "/"

  tags = {
    name = "terrauser1"
  }
}

resource "aws_iam_access_key" "user1" {
  user = aws_iam_user.user1.name
}

resource "aws_iam_user" "user2" {
  name = "TerraUser2"
  path = "/"

  tags = {
    name = "terrauser2"
  }
}
resource "aws_iam_access_key" "user2" {
  user = aws_iam_user.user2.name
}