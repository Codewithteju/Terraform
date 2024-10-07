terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"

    backend "s3" {
    bucket         = "store-tfstatefile"      # Replace with your bucket name
    key            = "terraform.tfstate"             # This is the path where the state file will be stored in the bucket
    region         = "us-east-1"                      # The same region where your bucket is located
    dynamodb_table = "terraform-locks"                # Replace with your DynamoDB table name
    encrypt        = true                              # Enable server-side encryption
  }
}

provider "aws" {
  region  = "us-east-1"
}

resource "aws_instance" "app_server" {
  ami           = "ami-0866a3c8686eaeeba"
  instance_type = "t2.micro"

  tags = {
    Name = "Terraform_Demo"
  }

}

resource "aws_s3_bucket" "store-tfstatefile" {
  
  bucket = "store-tfstatefile"

  acl    = "private"


}

resource "aws_dynamodb_table" "terraform_locks" {
  name         = "terraform-locks"
  billing_mode = "PAY_PER_REQUEST"

  hash_key = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name = "Terraform Lock Table"
  }
}




