terraform {
  backend "s3" {
    bucket         = "terraform-state-bucket41"
    key            = "fargate-terraform-project/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-lock-table"
  }
}
