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

#pending
resource "aws_iam_policy" "this_policy" {
  name        = "b24_policy"
  path        = "/"
  description = "My test policy"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "ec2:Describe*",

        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}