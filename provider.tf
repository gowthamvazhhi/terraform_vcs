terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region     = "us-east-1"
  access_key = "AKIA55ZCE2OC2PZSYGIR"
  secret_key = "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"
}

