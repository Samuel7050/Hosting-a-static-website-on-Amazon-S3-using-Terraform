# create S3 bucket
resource "aws_s3_bucket" "mytfbucket" {
  bucket = "staticwsebsite007"

  tags = {
    Name        = "static_website007"
    Environment = "Dev"
  }
}
# Bucket ownership control
resource "aws_s3_bucket_ownership_controls" "mytfbucket_ownership_control" {
  bucket = aws_s3_bucket.mytfbucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}
# Bucket public access block
resource "aws_s3_bucket_public_access_block" "mytfbucket_public_access_block" {
  bucket = aaws_s3_bucket.mytfbucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}
#Bucket acl
resource "aws_s3_bucket_acl" "mytfbucket_acl" {
  depends_on = [
    aws_s3_bucket_ownership_controls.mytfbucket_ownership_control,
    aws_s3_bucket_public_access_block.mytfbucket_public_access_block,
  ]

  bucket = aws_s3_bucket.mytfbucket.id
  acl    = "public-read"
}
# Bucket website configurations
resource "aws_s3_bucket_website_configuration" "mytfbucket_website_configuration" {
  bucket = aws_s3_bucket.mytfbucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
 }

# Upload an object
resource "aws_s3_bucket_object" "website_file" {
 bucket = aws_s3_bucket.mytfbucket.id
 key    = "terraform_key"
 source = "C:\Users\HP\Desktop\Azure\index.html"
 etag = filemd5("C:\Users\HP\Desktop\Azure\index.html")
}
