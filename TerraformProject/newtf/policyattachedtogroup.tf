resource "aws_iam_policy" "policy" {
  name        = "test-policy"
  description = "A test policy"
  policy      =  data.aws_iam_policy_document.grouppolicy.json
}

resource "aws_iam_group_policy_attachment" "test-attach" {
  group      = aws_iam_group.terragroup.name
  policy_arn = aws_iam_policy.policy.arn
}

data "aws_iam_policy_document" "grouppolicy" {
  statement {
    effect    = "Allow"
    actions   = ["ec2:Describe*","ec2:AttachVolume*","S3:*","RDS:*"]
    resources = ["*"]
  }
}

