resource "github_actions_variable" "s3_deployer_aws_default_region" {
  variable_name = "AWS_DEFAULT_REGION"
  repository    = github_repository.repository.name
  value         = var.s3_deployer_aws_default_region
}

resource "github_actions_variable" "s3_deployer_cloudfront_distribution_id" {
  for_each = var.project_environment_variables_for_client_release

  variable_name = each.key
  repository    = github_repository.repository.name
  value         = each.value
}