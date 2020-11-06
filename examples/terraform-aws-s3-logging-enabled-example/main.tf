# ---------------------------------------------------------------------------------------------------------------------
# PIN TERRAFORM VERSION TO >= 0.12
# The examples have been upgraded to 0.12 syntax
# ---------------------------------------------------------------------------------------------------------------------

terraform {
  # This module is now only being tested with Terraform 0.13.x. However, to make upgrading easier, we are setting
  # 0.12.26 as the minimum version, as that version added support for required_providers with source URLs, making it
  # forwards compatible with 0.13.x code.
  required_version = ">= 0.12.26"
}

# ---------------------------------------------------------------------------------------------------------------------
# DEPLOY A S3 BUCKET WITH LOGGING ENABLED
# See test/terraform_aws_s3_logging_enabled_example_test.go for how to write automated tests for this code.
# ---------------------------------------------------------------------------------------------------------------------

resource "aws_s3_bucket" "test-logs-bucket" {
  bucket = "origin-bucket-example-logs-target"
  acl    = "log-delivery-write"
}

resource "aws_s3_bucket" "test-origin-bucket" {
  bucket = "origin-bucket-example"
  acl    = "private"

  logging {
    target_bucket = aws_s3_bucket.test-logs-bucket.id
    target_prefix = "/"
  }
}

# ---------------------------------------------------------------------------------------------------------------------
# LOCALS
# Used to represent any data that requires complex expressions/interpolations
# ---------------------------------------------------------------------------------------------------------------------

data "aws_caller_identity" "current" {
}

locals {
  aws_account_id = data.aws_caller_identity.current.account_id
}

