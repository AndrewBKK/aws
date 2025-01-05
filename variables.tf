variable "aws_region" {
  description = "AWS region"
  default     = "us-east-1"
}

variable "s3_bucket_name" {
  description = "S3 bucket for static assets"
  default     = "nextjs-static-assets"
}

variable "lambda_server_function_name" {
  description = "Lambda function for server-side rendering"
  default     = "nextjs-server-functions"
}

variable "lambda_image_function_name" {
  description = "Lambda function for image optimization"
  default     = "nextjs-image-optimization"
}

variable "api_gateway_name" {
  description = "API Gateway for routing"
  default     = "nextjs-api"
}

variable "cloudfront_comment" {
  description = "CloudFront distribution"
  default     = "Next.js deployment distribution"
}
