variable "instance_type" {
  default = "t2.micro"
}

variable "default_cidr_block" {
  type        = string
  description = "Enter your ip here ($ curl ifconfig.me)"
}

variable "master_key" {
  default = "aws"
}

variable "slave_key" {
  default = "aws_jenkins"
}

variable "master_tags" {
  default = {
    Project  = "Jenkins"
    NodeType = "master"
  }
}

variable "slave_tags" {
  default = {
    Project  = "Jenkins"
    NodeType = "slave"
  }
}

variable "slave_count" {
  default = "0"
}