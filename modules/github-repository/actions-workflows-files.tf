#data "http" "terraform_apply" {
#  url = "https://raw.githubusercontent.com/${var.github_organization}/${var.github_repository}/main/.github/workflows/apply.terraform.yml"
#}

resource "github_repository_file" "s3_sync_and_invalidate_cache" {
  repository          = github_repository.repository.name
  branch              = github_branch_default.main.branch
  file                = ".github/workflows/autodeploy-clone-template.aws.yml"
  content             = module.workflow_template.rendered
  commit_message      = "feat: adding build s3 sync and invalidate cache workflow"
  commit_author       = var.commit_author_name
  commit_email        = var.commit_author_email
  overwrite_on_create = true

}

module "workflow_template" {
  source       = "github.com/codingones/terraform-remote-template-renderer"
  template_url = "https://raw.githubusercontent.com/codingones/github-files-templates/main/github-actions/autodeploy-clone-template.aws.yml"
  template_variables = {
    SERVICE      = var.service
    ORGANIZATION = var.github_organization
  }
}