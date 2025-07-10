# create EC2 instance 
resource "aws_instance" "web" {
  depends_on             = [aws_key_pair.bastion_key]
  ami                    = "ami-05ffe3c48a9991133"
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.bastion_key.key_name
  vpc_security_group_ids = [aws_security_group.allow_http_all.id, aws_security_group.allow_ssh_all.id]
  user_data = file("apache.sh")


  tags = {
    Name = "HelloWorld"
  }
}

# create an output to display the public IP of the EC2 instance
output "public_ip" {
  value = [aws_instance.web.public_ip]
}