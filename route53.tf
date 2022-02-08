# route53.tf

data "aws_route53_zone" "zone" {
  name         = var.hosted_zone_name
  private_zone = "false"
}

resource "aws_route53_record" "cname_record" {
  zone_id = data.aws_route53_zone.zone.zone_id
  name    = var.cname_record_name
  type    = "CNAME"
  ttl     = "300"
  records = [aws_lb.staging.dns_name]
}
