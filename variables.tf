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

variable "terraform_variables_to_copy_in_github" {
  type = list(object({
    key_in_terraform_organization_public_variable_set = string
    key_in_github_variables                           = string
  }))
  description = "An associative map of the terraform organization variables to expose publicly in the github client repository"
  nullable    = true
  default = [
    {
      key_in_terraform_organization_public_variable_set = "cloudfront_s3_bucket"
      key_in_github_variables                           = "AWS_S3_BUCKET"
    },
    {
      key_in_terraform_organization_public_variable_set = "cloudfront_distribution_id"
      key_in_github_variables                           = "AWS_CLOUDFRONT_DISTRIBUTION_ID"
    }
  ]
}

variable "github_token" {
  description = "A github PAT with the right to push and commit on the api repository"
  nullable    = false
  default     = false
}