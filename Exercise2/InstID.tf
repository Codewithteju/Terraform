data "aws_ami" "ami_ID" {
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"]
}

output "instance_id" {

  description = "AMI ID of Ubuntu Instance"
  value       = data.aws_ami.ami_ID.id
}

