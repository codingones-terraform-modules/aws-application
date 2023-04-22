module "s3_aws_deployer" {
  source = "github.com/codingones/terraform-aws-s3-client/modules/aws-s3-deployer"

  aws_organization = var.aws_organization
  service          = var.service
  s3_policy       = var.s3_policy

  providers = {
    aws = aws
  }
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

  s3_deployer_aws_access_key_id     = module.s3_aws_deployer.s3_deployer_iam_access_key_id
  s3_deployer_aws_secret_access_key = module.s3_aws_deployer.s3_deployer_iam_access_key_secret
  s3_deployer_aws_default_region    = "us-east-1"
  github_token                       = var.github_token

  providers = {
    github = github
    http   = http
  }

  depends_on = [module.s3_aws_deployer]
}