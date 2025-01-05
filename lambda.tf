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
  function_name = var.lambda_server_function_name
  role          = aws_iam_role.lambda_execution_role.arn
  runtime       = "nodejs16.x"
  handler       = "index.mjs"
  s3_bucket     = aws_s3_bucket.static_assets.id
  s3_key        = aws_s3_object.server_functions.key

  depends_on = [aws_s3_object.server_functions]
}

resource "aws_lambda_function" "image_optimization" {
  function_name = var.lambda_image_function_name
  role          = aws_iam_role.lambda_execution_role.arn
  runtime       = "nodejs16.x"
  handler       = "index.mjs"
  s3_bucket     = aws_s3_bucket.static_assets.id
  s3_key        = aws_s3_object.image_optimization.key

  depends_on = [aws_s3_object.image_optimization]
}
