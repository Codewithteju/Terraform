resource "aws_instance" "terraform" {
  ami                    = data.aws_ami.ami_ID.id
  instance_type          = "t3.micro"
  key_name               = aws_key_pair.dove-key.key_name
  vpc_security_group_ids = [aws_security_group.dove-sg.id]
  availability_zone      = "us-east-1a"


  tags = {
    Name    = "Dove-terraform"
    Project = "Dove"
  }
}

resource "aws_ec2_instance_state" "dove-state" {
  instance_id = aws_instance.terraform.id
  state = "running"
}