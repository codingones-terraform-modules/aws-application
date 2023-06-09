module "aws_deployer" {
  source = "github.com/codingones-terraform-modules/aws-iam-deployer"

  name                    = "${var.aws_organizational_unit}.${var.service}"
  aws_organizational_unit = var.aws_organizational_unit
  service                 = var.service
  policy                  = var.policy

  providers = {
    aws = aws
  }
}

module "github_repository" {
  source = "github.com/codingones-terraform-modules/github-repository-merge-templates"

  github_organization                  = var.github_organization
  github_repository                    = var.github_repository
  project                              = var.project
  service                              = var.service
  commit_author                        = var.commit_author
  commit_email                         = var.commit_email
  github_repository_topics             = var.github_repository_topics
  template_repositories                = var.template_repositories
  templated_files_variables            = var.templated_files_variables
  template_fork                        = var.template_fork
  allow_force_pushes_to_default_branch = var.allow_force_pushes_to_default_branch
  github_repository_visibility         = var.github_repository_visibility

  providers = {
    github = github
    http   = http
  }
}

resource "github_actions_secret" "api_deployer_access_key_id" {
  secret_name     = "AWS_ACCESS_KEY_ID"
  repository      = var.github_repository
  plaintext_value = module.aws_deployer.aws_deployer_iam_access_key_id

  depends_on = [module.aws_deployer, module.github_repository]
}

resource "github_actions_secret" "api_deployer_access_key_secret" {
  secret_name     = "AWS_SECRET_ACCESS_KEY"
  repository      = var.github_repository
  plaintext_value = module.aws_deployer.aws_deployer_iam_access_key_secret

  depends_on = [module.aws_deployer, module.github_repository]
}