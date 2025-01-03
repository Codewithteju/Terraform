#This will retrieve the tf state sensitive information and move into the AWS s3 bucket so that tfstate file will be secured

terraform {
  backend "s3" {
    region = "us-east-1"
    bucket = "bucket_name"
    key = "buckey-key"
  }
}