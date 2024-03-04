resource "aws_iam_user" "adarsh" {
  name = var.this_aws_iam_user_users[0]
  path = var.this_aws_iam_user_path
}
resource "aws_iam_user" "shruti" {
  name = var.this_aws_iam_user_users[2]
  path = var.this_aws_iam_user_path
}

resource "aws_iam_user" "tejas" {
  name = var.this_aws_iam_user_path_tejas.a[2]
  path = var.this_aws_iam_user_path_tejas.c
}