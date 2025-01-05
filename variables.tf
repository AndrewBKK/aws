variable "aws_region" {
  description = "AWS region"
  default     = "ap-southeast-1"
}

variable "s3_bucket_name" {
  description = "S3 bucket for static assets"
  default     = "nextjs-static-assets-${random_string.suffix.result}"
}

variable "lambda_server_function_name" {
  description = "Lambda function for server-side rendering"
  default     = "nextjs-server-functions-${random_string.suffix.result}"
}

variable "lambda_image_function_name" {
  description = "Lambda function for image optimization"
  default     = "nextjs-image-optimization-${random_string.suffix.result}"
}

variable "api_gateway_name" {
  description = "API Gateway for routing"
  default     = "nextjs-api-${random_string.suffix.result}"
}

variable "cloudfront_comment" {
  description = "CloudFront distribution"
  default     = "Next.js deployment distribution"
}

resource "random_string" "suffix" {
  length  = 6
  special = false
  upper   = false
}