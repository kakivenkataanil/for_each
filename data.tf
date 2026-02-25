data "aws_ami" "devops_practice" {
  most_recent = true
  owners = [ "973714476881" ]
filter {
  name   = "virtualization-type"
  values = ["hvm"]
  }
  filter {
  name   = "name"
  values = ["Redhat-9-DevOps-Practice"]
  }
}