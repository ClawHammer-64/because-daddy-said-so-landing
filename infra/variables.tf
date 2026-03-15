variable "aws_region" {
  type        = string
  description = "AWS region for primary resources."
  default     = "us-east-2"
}

variable "domain_name" {
  type        = string
  description = "Root domain for the site."
  default     = "becausedaddysaidso.shop"
}

variable "bucket_name" {
  type        = string
  description = "S3 bucket name for the site content."
  default     = "becausedaddysaidso-shop-landing"
}
