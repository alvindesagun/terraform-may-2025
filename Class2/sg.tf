# Create a security group for the EC2 instance
resource "aws_security_group" "allow_ssh_all" {
  name        = "allow_ssh_all"
  description = "Allow SSH access"
  vpc_id      = "vpc-06a58793a3a60518c"

  # Allow SSH access from anywhere  
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

resource "aws_security_group" "allow_http_all" {
  name        = "allow_http_all"
  description = "Allow HTTP access"
  vpc_id      = "vpc-06a58793a3a60518c"

  # Allow HTTP access from anywhere  
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  # Allow HTTPS access from anywhere
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

}