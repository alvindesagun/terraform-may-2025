terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

module "may" {
  source  = "alvindesagun/may/vpc"
  version = "1.0.0"
  vpc_cidr     = "172.31.0.0/16"
  subnet1_cidr = "172.31.1.024"
  subnet2_cidr = "172.31.2.024"
  subnet3_cidr = "172.31.3.0/24"
}
