output "s3_bucket_name" {
  value       = aws_s3_bucket.store-tfstatefile.bucket
  description = "The name of the S3 bucket"
}

output "dynamodb_table_name" {
  value       = aws_dynamodb_table.terraform_locks.name
  description = "The name of the DynamoDB table"
}

output "dynamodb_table_arn" {
  value       = aws_dynamodb_table.terraform_locks.arn
  description = "The ARN of the DynamoDB table"
}

