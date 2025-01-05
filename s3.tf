resource "aws_s3_bucket" "static_assets" {
  bucket = var.s3_bucket_name
}

resource "aws_s3_bucket_public_access_block" "static_assets" {
  bucket                  = aws_s3_bucket.static_assets.id
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_object" "server_functions" {
  bucket = aws_s3_bucket.static_assets.id
  key    = "server-functions.zip"
  source = "./server-functions.zip"
}

resource "aws_s3_object" "image_optimization" {
  bucket = aws_s3_bucket.static_assets.id
  key    = "image-optimization.zip"
  source = "./image-optimization.zip"
}
