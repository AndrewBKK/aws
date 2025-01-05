resource "aws_s3_bucket" "static_assets" {
  bucket = var.s3_bucket_name
  acl    = "public-read"
}

resource "aws_s3_bucket_object" "static_assets" {
  bucket = aws_s3_bucket.static_assets.id
  key    = "static-assets.zip"
  source = "./static-assets.zip"
}
