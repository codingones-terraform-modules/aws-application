terraform {
  required_providers {
    github = {
      source = "integrations/github"
    }
    aws = {
      source = "hashicorp/aws"
    }
    http = {
      source = "hashicorp/http"
    }
    tfe = {
      source = "hashicorp/tfe"
    }
  }
}