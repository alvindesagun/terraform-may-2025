# creeate a VPC
resource "aws_vpc" "kaizen" {
  cidr_block           = var.vpc.cidr_block
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags                 = local.common_tags
}