variable "aws_region" {
  description = "AWS region"
  default     = "ap-southeast-1"
}

variable "s3_bucket_name" {
  description = "S3 bucket for static assets"
  default     = "nextjs-static-assets-cmslab"
}

variable "lambda_server_function_name" {
  description = "Lambda function for server-side rendering"
  default     = "nextjs-server-functions-cmslab"
}

variable "lambda_image_function_name" {
  description = "Lambda function for image optimization"
  default     = "nextjs-image-optimization-cmslab"
}

variable "api_gateway_name" {
  description = "API Gateway for routing"
  default     = "nextjs-api-cmslab"
}

variable "cloudfront_comment" {
  description = "CloudFront distribution"
  default     = "Next.js deployment distribution"
}

