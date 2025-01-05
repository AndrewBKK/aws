resource "aws_cloudfront_distribution" "cdn" {
  origin {
    domain_name = aws_s3_bucket.static_assets.bucket_regional_domain_name
    origin_id   = "static-assets-origin"

    custom_origin_config {
      http_port              = 80
      https_port             = 443
      origin_protocol_policy = "https-only"
    }
  }

  default_cache_behavior {
    target_origin_id       = "static-assets-origin"
    viewer_protocol_policy = "redirect-to-https"
    allowed_methods        = ["GET", "HEAD", "OPTIONS"]
    cached_methods         = ["GET", "HEAD"]
    forwarded_values {
      query_string = false
    }
  }

  enabled = true
  default_root_object = "index.html"
  comment = var.cloudfront_comment

  viewer_certificate {
    cloudfront_default_certificate = true
  }
}
