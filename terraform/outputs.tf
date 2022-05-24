output "master_id" {
  value = aws_instance.master.id
}

output "master_public_ip" {
  value = aws_instance.master.public_ip
}

output "master_public_dns" {
  value = aws_instance.master.public_dns
}

output "slave_id" {
  value = aws_instance.slave.*.id
}

output "slave_private_ip" {
  value = aws_instance.slave.*.private_ip
}

