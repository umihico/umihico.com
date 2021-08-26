locals {
  domain = "umihico.com"
}
resource "aws_route53_zone" "umihico_com" {
  comment = "HostedZone created by Route53 Registrar" # and imported
  name    = local.domain
}

resource "aws_route53_record" "record_txt" {
  zone_id = aws_route53_zone.umihico_com.zone_id
  name    = local.domain
  type    = "TXT"
  ttl     = "300"
  records = [var.secret_google_txt]
}
