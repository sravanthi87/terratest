output "bucket_id" {
  value = aws_s3_bucket.test_bucket.id
}

output "bucket_arn" {
  value = aws_s3_bucket.test_bucket.arn
}

output "logging_target_bucket" {
  value = aws_s3_bucket.test_bucket.logging[*].target_bucket
}