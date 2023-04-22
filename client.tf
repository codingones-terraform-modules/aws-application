module "s3_aws_deployer" {
  source = "github.com/codingones/terraform-aws-s3-client/modules/aws-s3-deployer"

  aws_organization = var.aws_organization
  service          = var.service
  s3_policy        = var.s3_policy

  providers = {
    aws = aws
  }
}

data "tfe_variable_set" "public" {
  name         = "variables"
  organization = var.terraform_organization
}

data "tfe_variables" "variables" {
  variable_set_id = data.tfe_variable_set.public.id
}

locals {
  s3_bucket_index     = index(data.tfe_variables.variables.terraform.*.name, "s3_deployer_s3_bucket")
  cloudfront_id_index = index(data.tfe_variables.variables.terraform.*.name, "s3_deployer_cloudfront_distribution_id")
}

module "api_github_repository" {
  source = "github.com/codingones/terraform-aws-s3-client/modules/github-repository"

  github_organization = var.github_organization
  github_repository   = var.github_repository
  project             = var.project
  service             = var.service
  commit_author_name  = var.commit_author_name
  commit_author_email = var.commit_author_email
  about               = var.about

  s3_deployer_aws_access_key_id          = module.s3_aws_deployer.s3_deployer_iam_access_key_id
  s3_deployer_aws_secret_access_key      = module.s3_aws_deployer.s3_deployer_iam_access_key_secret
  s3_deployer_aws_default_region         = "us-east-1"
  s3_deployer_s3_bucket                  = element(data.tfe_variables.variables.terraform, local.s3_bucket_index).value     //data.tfe_variables.variables.terraform["s3_deployer_s3_bucket"].value
  s3_deployer_cloudfront_distribution_id = element(data.tfe_variables.variables.terraform, local.cloudfront_id_index).value //data.tfe_variables.variables.terraform["s3_deployer_cloudfront_distribution_id"].value
  github_token                           = var.github_token

  providers = {
    github = github
    http   = http
  }

  depends_on = [module.s3_aws_deployer]
}