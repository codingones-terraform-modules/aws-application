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
  description = "A brief description of the repository and project"
  nullable    = false
  default     = false
}

variable "github_organization" {
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

variable "s3_deployer_aws_access_key_id" {
  description = "The s3 deployer access key id"
  nullable    = false
  default     = false
  sensitive   = true
}

variable "s3_deployer_aws_secret_access_key" {
  description = "The s3 deployer secret access key"
  nullable    = false
  default     = false
  sensitive   = true
}

variable "s3_deployer_aws_default_region" {
  description = "The s3 deployer region"
  nullable    = false
  default     = false
}

variable "github_token" {
  description = "A github PAT with the right to push and commit on the api repository"
  nullable    = false
  default     = false
}