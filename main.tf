# create S3 bucket
resource "aws_s3_bucket" "tf_bucket" {
  bucket = var.bucket_name
}

# Bucket ownership control
resource "aws_s3_bucket_ownership_controls" "tf_bucket" {
  bucket = aws_s3_bucket.tf_bucket.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

#Bucket acl
resource "aws_s3_bucket_public_access_block" "tf_bucket" {
  bucket = aws_s3_bucket.tf_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_acl" "tf_bucket" {
  depends_on = [
    aws_s3_bucket_ownership_controls.tf_bucket,
    aws_s3_bucket_public_access_block.tf_bucket,
  ]

  bucket = aws_s3_bucket.tf_bucket.id
  acl    = "public-read"
}

# Bucket website configurations
resource "aws_s3_bucket_website_configuration" "tf_bucket" {
  bucket = aws_s3_bucket.tf_bucket.id

  index_document {
    suffix = "index.html"
  }
}

# Upload an object
resource "aws_s3_object" "file" {
  bucket = aws_s3_bucket.tf_bucket.id
  key    = "index.html"
  source = "index.html"
}


