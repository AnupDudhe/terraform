resource "aws_iam_user" "lb" {
  name = "TerraUser"
  path = "/"

  tags = {
    tag-key = "tag-value"
  }
}

resource "aws_iam_access_key" "lb" {
  user = aws_iam_user.lb.name
}

