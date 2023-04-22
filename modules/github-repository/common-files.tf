resource "github_repository_file" "readme" {
  repository          = github_repository.repository.name
  branch              = github_branch_default.main.branch
  file                = "README.md"
  content             = module.readme_template.rendered
  commit_message      = "feat: adding readme"
  commit_author       = var.commit_author_name
  commit_email        = var.commit_author_email
  overwrite_on_create = true
}

resource "github_repository_file" "license" {
  repository          = github_repository.repository.name
  branch              = github_branch_default.main.branch
  file                = "LICENSE.md"
  content             = module.license_template.rendered
  commit_message      = "feat: adding license"
  commit_author       = var.commit_author_name
  commit_email        = var.commit_author_email
  overwrite_on_create = true
}

resource "github_repository_file" "gitignore" {
  repository          = github_repository.repository.name
  branch              = github_branch_default.main.branch
  file                = ".gitignore"
  content             = data.http.gitignore_template.response_body
  commit_message      = "feat: adding gitignore"
  commit_author       = var.commit_author_name
  commit_email        = var.commit_author_email
  overwrite_on_create = true
}

data "http" "gitignore_template" {
  url = "https://raw.githubusercontent.com/codingones/github-files-templates/main/gitignore/.gitignore_api_node"
}

module "license_template" {
  source       = "github.com/codingones/terraform-remote-template-renderer"
  template_url = "https://raw.githubusercontent.com/codingones/github-files-templates/main/license/LICENSE_MIT.md"
  template_variables = {
    OWNER = "CodingOnes"
  }
}

module "readme_template" {
  source       = "github.com/codingones/terraform-remote-template-renderer"
  template_url = "https://raw.githubusercontent.com/codingones/github-files-templates/main/readme/README_SERVICE_CLIENT_REPOSITORY.md"
  template_variables = {
    SERVICE      = var.service
    PROJECT      = var.project
    REPOSITORY   = var.github_repository
    ORGANIZATION = var.github_organization
  }
}