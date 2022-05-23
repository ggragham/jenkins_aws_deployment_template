provider "aws" {
  region = "eu-central-1"
}

# EC2

resource "aws_instance" "master" {
  ami                    = data.aws_ami.debian.id
  instance_type          = var.instance_type
  key_name               = var.master_key
  vpc_security_group_ids = [aws_security_group.jenkins.id, aws_security_group.ssh.id]
  tags                   = var.master_tags
}

resource "aws_instance" "slave" {
  ami                    = data.aws_ami.debian.id
  instance_type          = var.instance_type
  key_name               = var.slave_key
  vpc_security_group_ids = [aws_security_group.ssh.id]
  tags                   = var.slave_tags
  count                  = var.slave_count
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

resource "aws_security_group" "ssh" {
  name        = "ssh"
  description = "Allow 20 port for ssh"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    description = "tcp 22"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${var.default_cidr_block}/32"]
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

resource "aws_security_group" "jenkins" {
  name        = "jenkins"
  description = "Allow 8080 port for Jenkins"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    description = "tcp 8080"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["${var.default_cidr_block}/32"]
  }
}
