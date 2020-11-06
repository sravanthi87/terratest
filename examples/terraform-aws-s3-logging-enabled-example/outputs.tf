output "bucket_id" {
  value = aws_s3_bucket.test-origin-bucket.id
}

output "logging_target_bucket" {
  value = aws_s3_bucket.test-origin-bucket.logging[*].target_bucket
}

output "bucket_arn" {
  value = aws_s3_bucket.test-origin-bucket.arn
}

