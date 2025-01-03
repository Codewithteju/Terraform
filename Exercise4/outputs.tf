output "instance_ip_addr" {
  value = aws_instance.terraform.public_ip
}

