variable "aws_organization" {
  description = "The organization name in aws organizations"
  nullable    = false
  default     = false
}

variable "service" {
  description = "The service name in the Project-Service-Layer architecture"
  nullable    = false
  default     = false
}

variable "s3_policy" {
  description = "The api deployer group policy that grants s3 sync and cache invalidation"
  nullable    = false
  default     = false
}