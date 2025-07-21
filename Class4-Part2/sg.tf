# Create a security group for the EC2 instance
resource "aws_security_group" "sg" {
  name        = "hw3-pub-allow-sg"
  description = "Homework 23 Public Security Group"
  vpc_id      = aws_vpc.kaizen.id


  # Use dynamic blocks to allow inbound traffic for the specified ports 
  dynamic "ingress" {
    for_each = var.port
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  # Allow all outbound traffic

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  tags = local.common_tags
}