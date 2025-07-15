# Create locals variable for the ports to be opened
locals {
  ports = [22, 80, 443, 3306] # SSH, HTTP, HTTPS, MySQL
}

# Create a security group for the EC2 instance
resource "aws_security_group" "sg" {
  name        = "my-allow-sg"
  description = "Class 3 Security Group"
  vpc_id      = aws_vpc.my-vpc.id


  # Use dynamic blocks to allow inbound traffic for the specified ports 
  dynamic "ingress" {
    for_each = local.ports
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

}