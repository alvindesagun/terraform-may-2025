# create EC2 instance in us-east-1 
resource "aws_instance" "web" {
  depends_on             = [aws_key_pair.bastion_key]
  for_each               = aws_subnet.subnet
  subnet_id              = each.value.id
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.bastion_key.key_name
  vpc_security_group_ids = [aws_security_group.sg.id]
  user_data              = file("apache.sh")
  tags = {
    Name = "web-${each.key}"
  }
}

# create an output to display the public IP of the EC2 instance
output "public_ip" {
  value = { for i, instance in aws_instance.web : i => instance.public_ip }
}