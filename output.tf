output "bucket_arn" {
  description = "s3 bucket_arn"
  value       = aws_s3_bucket.bucket.arn
}

output "bucket_name" {
  description = "s3 bucketid"
  value       = aws_s3_bucket.bucket.id
}

output "bucket_domain" {
  description = "s3 bucket_domain"
  value       = aws_s3_bucket_website_configuration.mytfbucket_website_configuration.website_domain
}
