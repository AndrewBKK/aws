resource "aws_s3_bucket" "static_assets" {
  bucket = var.s3_bucket_name
}

resource "aws_s3_bucket_acl" "static_assets_acl" {
  bucket = aws_s3_bucket.static_assets.id
  acl    = "public-read"
}

resource "aws_s3_object" "static_assets" {
  bucket = aws_s3_bucket.static_assets.id
  key    = "static-assets.zip"
  source = "./static-assets.zip"
}
