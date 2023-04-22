output "s3_deployer_iam_access_key_id" {
  value     = aws_iam_access_key.s3_deployer_access_key.id
  sensitive = true
}

output "s3_deployer_iam_access_key_secret" {
  value     = aws_iam_access_key.s3_deployer_access_key.secret
  sensitive = true
}