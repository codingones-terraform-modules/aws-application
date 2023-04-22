variable "terraform_organization" {
  description = "The terraform organization name"
  nullable    = false
  default     = false
}

variable "github_organization" {
  description = "The github organization name"
  nullable    = false
  default     = false
}

variable "aws_organization" {
  description = "The github organization name"
  nullable    = false
  default     = false
}

variable "github_repository" {
  description = "The repository which host the code within the organization"
  nullable    = false
  default     = false
}

variable "commit_author_name" {
  description = "The commit author name for generated files"
  nullable    = false
  default     = false
}


variable "commit_author_email" {
  description = "The commit author email for generated files"
  nullable    = false
  default     = false
}

variable "project" {
  description = "The project name in the Project-Service-Layer architecture"
  nullable    = false
  default     = false
}

variable "service" {
  description = "The service name in the Project-Service-Layer architecture"
  nullable    = false
  default     = false
}

variable "about" {
  type        = string
  description = "A brief description of the repository and project"
  nullable    = true
  default     = ""
}

variable "s3_policy" {
  description = "The api deployer group policy that grants s3 sync and cache invalidation"
  nullable    = false
}

variable "github_token" {
  description = "A github PAT with the right to push and commit on the api repository"
  nullable    = false
  default     = false
}