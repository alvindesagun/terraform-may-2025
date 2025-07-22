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

resource "aws_key_pair" "deployer" {
  key_name   = "class5-key"
  public_key = file("~/.ssh/id_rsa.pub")
}

#resource "null_resource" "cluster" {
#  provisioner "local-exec" {
#    command = "mkdir kaizen"
#  }
#}

resource "aws_instance" "web" {
  ami                    = "ami-0cbbe2c6a1bb2ad63"
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.deployer.key_name
  vpc_security_group_ids = [aws_security_group.sg.id]
}

resource "null_resource" "cluster" {
  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("~/.ssh/id_rsa")
    host        = aws_instance.web.public_ip
  }
  provisioner "remote-exec" {
    inline = [
      "sudo yum install -y httpd",
      "sudo systemctl start httpd",
      "sudo systemctl enable httpd"
    ]
  }
}

output "public_ip" {
  value = aws_instance.web.public_ip
}