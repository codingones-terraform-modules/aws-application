resource "github_actions_secret" "api_deployer_access_key_id" {
  secret_name     = "AWS_ACCESS_KEY_ID"
  repository      = github_repository.repository.name
  plaintext_value = var.s3_deployer_aws_access_key_id
}

resource "github_actions_secret" "api_deployer_access_key_secret" {
  secret_name     = "AWS_SECRET_ACCESS_KEY"
  repository      = github_repository.repository.name
  plaintext_value = var.s3_deployer_aws_secret_access_key
}

resource "github_actions_variable" "api_deployer_aws_default_region" {
  variable_name = "AWS_DEFAULT_REGION"
  repository    = github_repository.repository.name
  value         = var.s3_deployer_aws_default_region
}

resource "github_actions_secret" "github_pat" {
  secret_name     = "PAT_TOKEN"
  repository      = github_repository.repository.name
  plaintext_value = var.github_token
}
