# Create key pair to access the EC2 instances created by the deployer
resource "aws_key_pair" "bastion_key" {
  key_name   = "bastion-key"
  public_key = file("~/.ssh/id_rsa.pub")
}

# Create an S3 bucket
resource "aws_s3_bucket" "kaizen_bucket" {
  bucket        = "kaizen-alvind"
  force_destroy = true
}

# Upload the Terraform state file to the S3 bucket
resource "aws_s3_object" "tfstate_object" {
  depends_on = [aws_s3_bucket.kaizen_bucket]
  bucket     = "kaizen-alvind"
  key        = "terraform.tfstate"
  source     = "terraform.tfstate"
}