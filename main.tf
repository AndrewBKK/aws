provider "aws" {
  region = var.aws_region
}

module "s3" {
  source = "./s3.tf"
}

module "lambda" {
  source = "./lambda.tf"
}

module "api_gateway" {
  source = "./api_gateway.tf"
}

module "cloudfront" {
  source = "./cloudfront.tf"
}