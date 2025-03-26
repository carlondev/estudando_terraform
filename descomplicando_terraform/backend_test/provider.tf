terraform {
  backend "s3" {
    bucket = "terraform-test-2k25" 
    key    = "backend_test"
    region = "us-east-1"
  }

  required_providers {
    aws = {
        source  = "hashicorp/aws"
        version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}