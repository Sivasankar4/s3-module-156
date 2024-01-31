resource "aws_s3_bucket" "main" {
  bucket = var.bucket_name
}

resource "aws_s3_bucket_ownership_controls" "owner" {
  bucket = aws_s3_bucket.main.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "my_acl_private" {
  count = var.public_acl ? 0:1
  
  depends_on = [aws_s3_bucket_ownership_controls.owner]

  bucket = aws_s3_bucket.main.id
  acl    = "private"
}

resource "aws_s3_bucket_public_access_block" "my_acl_public" {

  count = var.public_acl ? 1:0

  bucket = aws_s3_bucket.main.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_acl" "public" {

  count = var.public_acl ? 1:0

  depends_on = [
    aws_s3_bucket_ownership_controls.owner,
    aws_s3_bucket_public_access_block.my_acl_public,
  ]

  bucket = aws_s3_bucket.main.id
  acl    = "public-read"
}

resource "aws_s3_bucket_versioning" "versioning_example" {

  bucket = aws_s3_bucket.example.id
  versioning_configuration {
    status = var.versioning ? "Enabled":"Disabled"
  }
}