terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region                      = "us-east-1"
  access_key                  = "test"
  secret_key                  = "test"
  skip_credentials_validation = true
  skip_requesting_account_id  = true
  s3_use_path_style           = true
  endpoints {
    s3     = "http://localhost:4566"
    lambda = "http://localhost:4566"
    dynamodb = "http://localhost:4566"
  }
}

resource "aws_s3_bucket" "test_bucket" {
  bucket = "my-local-bucket"
}

output "bucket_name" {
  value = aws_s3_bucket.test_bucket.id
}

