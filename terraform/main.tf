provider "aws" {
  region = "eu-central-1"
}

# EC2

resource "aws_instance" "jenkins" {
  ami                    = data.aws_ami.debian.id
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.jenkins.id]
  tags                   = var.tags
}

# AMI

data "aws_ami" "debian" {
  most_recent = true
  owners      = ["136693071363"]
  filter {
    name   = "name"
    values = ["debian-11-amd64-*"]
  }
}

# VPC

data "aws_vpc" "default" {
  default = true
}

# Security Group

resource "aws_security_group" "jenkins" {
  name        = "jenkins"
  description = "Allow 8080 port for Jenkins and 22 port for SSH"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    description = "tcp 8080"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = [var.default_cidr_block]
  }
  ingress {
    description = "tcp 22"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.default_cidr_block]
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = [var.default_cidr_block]
    ipv6_cidr_blocks = ["::/0"]
  }
}
