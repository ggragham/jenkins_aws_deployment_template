variable "instance_type" {
  default = "t2.micro"
}

variable "key_name" {
  default = "aws"
}

variable "default_cidr_block" {
  type        = string
  description = "Enter your ip here ($ curl ifconfig.me)"
}

variable "tags" {
  default = {
    Project = "Jenkins"
  }
}