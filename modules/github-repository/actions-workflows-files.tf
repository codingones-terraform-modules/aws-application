#data "http" "terraform_apply" {
#  url = "https://raw.githubusercontent.com/${var.github_organization}/${var.github_repository}/main/.github/workflows/apply.terraform.yml"
#}

resource "github_repository_file" "fork_template_workflow" {
  repository          = github_repository.repository.name
  branch              = "main"
  file                = ".github/workflows/fork-template.yml"
  content             = module.workflow_template.rendered
  commit_message      = "feat: adding fork template workflow"
  commit_author       = var.commit_author_name
  commit_email        = var.commit_author_email
  overwrite_on_create = true

  lifecycle {
    ignore_changes = all
  }
}

module "workflow_template" {
  source       = "github.com/codingones/terraform-remote-template-renderer"
  template_url = "https://raw.githubusercontent.com/codingones/github-files-templates/main/github-actions/fork-template.yml"
  template_variables = {
    SERVICE      = var.service
    ORGANIZATION = var.github_organization
  }
}