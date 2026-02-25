resource "aws_route53_zone" "garuda" {
  name = "garuda.com"

  tags = {
    Environment = "Dev"
  }
}

resource "aws_route53_record" "garuda-ns" {
  for_each = aws_instance.garuda
  zone_id = aws_route53_zone.garuda.zone_id
  name    = each.key == "frontend" ? var.domain_name : "${each.key}.${var.domain_name}"
  type    = "A"
  ttl     = "1"
  records = each.key == "frontend" ? [each.value.public_ip] : [each.value.private_ip]
}