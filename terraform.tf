provider "aws" {
  region = var.region
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = "poc-eks-terraform-state-bucket"
  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
  
#  lifecycle {
#    prevent_destroy = true
#  }
}


resource "aws_dynamodb_table" "terraform_locsk" {
  name         = "poc-eks-terraform-locks"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
#  lifecycle {
#    prevent_destroy = true
#  }
}

terraform {
  backend "s3" {
    bucket         = "poc-eks-terraform-state-bucket"
    key            = "global/s3/terraform.tfstate"
    region         = "sa-east-1"
    dynamodb_table = "poc-eks-terraform-locks"
    encrypt        = true
  }
}

