provider "aws" {
  region = var.aws_region
}

terraform {
  backend "s3" {
    bucket         = "sipstr-terraform-state-bucket"
    key            = "env/app/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "sipstr-terraform-locks"  # <-- this requires DynamoDB permissions
  }
}