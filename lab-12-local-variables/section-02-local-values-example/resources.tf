# Terraform Block
terraform {
  required_version = "~> 0.15.4" # which means any version equal & above 0.14 like 0.15, 0.16 etc and < 1.xx
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Provider Block
provider "aws" {
  region  = var.aws_region
  profile = "default"
}

####Note regarding lab usage of and the local values blocks#########
####Replace all references to lab Pod Number 0 with your unqiue, assigned pod number
####Example - bucket-0 - replace  the key value with your own pod number such
#### as (bucket-1)
####If preferred and for expidency/precision - considering doing a replace all such as - replace all 
####occurances of -0 with -1

# Define Local Values
locals {
  bucket-name = "${var.app_name}-${var.environment_name}-bucket-0" # Complex expression
}

# Create S3 Bucket - with Input Variables & Local Values
resource "aws_s3_bucket" "mys3bucket" {
  bucket = local.bucket-name
  acl    = "private"
  tags = {
    Name        = local.bucket-name
    Environment = var.environment_name
  }
}
