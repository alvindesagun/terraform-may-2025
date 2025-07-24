terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

module "may" {
  source       = "git@github.com:alvindesagun/terraform-vpc-may.git?ref=v1.0.1"
  vpc_cidr     = "172.31.0.0/16"
  subnet1_cidr = "172.31.1.0/24"
  subnet2_cidr = "172.31.2.0/24"
  subnet3_cidr = "172.31.3.0/24"
}
