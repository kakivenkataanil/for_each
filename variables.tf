variable "instance_type" {
  type = map
  default = {
    frontend = "t3.micro"
    backend = "t3.micro"
    mysql = "t3.small"
  }
}

variable "domain_name" {
  default = "garuda.com"
}