terraform {
  backend "s3" {
    bucket = "trungvu-devops-test-bucket"
    key    = "terraform/terraform.tfstate"
    region = "ap-southeast-1"
    encrypt = true
    # Optional: add a DynamoDB table for state locking:
    # dynamodb_table = "trungvu-devops-test-locks"
  }
}
