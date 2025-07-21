# create EC2 
resource "aws_instance" "ubuntu" {
  depends_on             = [aws_key_pair.bastion_key]
  subnet_id              = [for s in aws_subnet.public_subnet : s.id][1]
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type
  key_name               = aws_key_pair.bastion_key.key_name
  vpc_security_group_ids = [aws_security_group.sg.id]
  user_data              = file("apache.sh")
  tags = {
    Name = "Ubuntu"
  }
}