# create S3 bucket
resource "aws_s3_bucket" "bucket" {
  bucket = tfbucket007
}

# Bucket ownership control
resource "aws_s3_bucket_ownership_controls" "bucket-ownership-control" {
  bucket = aws_s3_bucket.bucket.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

#Bucket acl
resource "aws_s3_bucket_acl" "bucket-acl" {
  depends_on = [aws_s3_bucket_ownership_controls.example]

  bucket = aws_s3_bucket.bucket.id
  acl    = "public-read"
}

# Bucket website configurations
resource "aws_s3_bucket_website_configuration" "bucket-website-configuration" {
  bucket = aws_s3_bucket.bucket.id

  index_document {
    suffix = "index.html"
  }
 }

# Upload an object
resource "aws_s3_object" "file" {
  bucket = aws_s3_bucket.bucket.id
  key    = "index.html"
 source = "C:\Users\HP\Desktop\Terraform_Project\Hosting-a-static-website-on-Amazon-S3-using-Terraform\index.html"
}


