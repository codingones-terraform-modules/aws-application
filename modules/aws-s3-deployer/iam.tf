resource "aws_iam_user" "s3_deployer" {
  name = "${var.aws_organization}.${var.service}.s3"
}

resource "aws_iam_group" "s3_deployer_group" {
  name = "s3.deployer"
}

resource "aws_iam_user_group_membership" "s3_deployer_membership" {
  user = aws_iam_user.s3_deployer.name

  groups = [
    aws_iam_group.s3_deployer_group.name,
  ]
}

resource "aws_iam_access_key" "s3_deployer_access_key" {
  user = aws_iam_user.s3_deployer.name
}

resource "aws_iam_group_policy_attachment" "service_policy_attachment" {
  policy_arn = aws_iam_policy.s3_policy.arn
  group      = aws_iam_group.s3_deployer_group.name
}

resource "aws_iam_policy" "s3_policy" {
  name        = "s3.policy"
  description = "Policy that grants s3 sync and cache invalidation"

  policy = var.s3_policy
}