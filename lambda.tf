resource "aws_iam_role" "lambda_execution_role" {
  name = "lambda_execution_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_lambda_function" "server_functions" {
  function_name = "nextjs-server-functions"
  role          = aws_iam_role.lambda_execution_role.arn
  runtime       = "nodejs16.x"
  handler       = "index.handler"
  s3_bucket     = aws_s3_bucket.static_assets.id
  s3_key        = "server-functions.zip"
}

resource "aws_lambda_function" "image_optimization" {
  function_name = "nextjs-image-optimization"
  role          = aws_iam_role.lambda_execution_role.arn
  runtime       = "nodejs16.x"
  handler       = "index.handler"
  s3_bucket     = aws_s3_bucket.static_assets.id
  s3_key        = "image-optimization.zip"
}
