output "bucket_arn" {
  description = "s3 bucket_arn"
  value       = aws_s3_bucket.tf_bucket.arn
}

output "bucket_name" {
  description = "s3 bucketid"
  value       = aws_s3_bucket.tf_bucket.id
}

output "bucket_domain" {
  description = "s3 bucket_domain"
  value       = aws_s3_bucket_website_configuration.tf_bucket.website_endpoint
}


output "website_url" {
  value = "http://${aws_s3_bucket.tf_bucket.bucket}.s3-website.${var.region}.amazonaws.com"
  }