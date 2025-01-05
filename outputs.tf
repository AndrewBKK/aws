output "api_endpoint" {
  value       = aws_apigatewayv2_api.http_api.api_endpoint
  description = "The endpoint for the Next.js API"
}

output "cloudfront_domain" {
  value       = aws_cloudfront_distribution.cdn.domain_name
  description = "CloudFront distribution domain for static assets"
}
