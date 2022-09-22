# Terraform Settings Block
terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 4.0"
     }
  }
  # Adding Backend as S3 for Remote State Storage
  backend "s3" {
    bucket = "myterraformstate-06207159"
    key    = "gh.com/intersight/example01/terraform.tfstate"
    region = "us-east-1"
 
    # For State Locking
    dynamodb_table = "intersight-terraform-lock"    
  }  
}

# Terraform Provider Block
provider "aws" {
  region = var.aws_region
  profile = "myfernandez"
}