resource "aws_s3_bucket" "static_assets" {
  bucket = var.s3_bucket_name
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

resource "aws_s3_bucket_policy" "static_assets_policy" {
  bucket = aws_s3_bucket.static_assets.id
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect    = "Allow",
        Principal = "*",
        Action    = ["s3:GetObject"],
        Resource  = ["${aws_s3_bucket.static_assets.arn}/*"]
      }
    ]
  })
}
