resource "aws_instance" "garuda" {
  for_each = var.instance_type
  ami = data.aws_ami.devops_practice.id
  instance_type = each.value
  vpc_security_group_ids = [aws_security_group.allow_ssh_terraform.id]
  tags = {
    Name = each.key
  }
}


resource "aws_security_group" "allow_ssh_terraform" {
  name        = "sg_ssh"

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]

  }
  tags = {
    Name = "allow_ssh"
  }
}