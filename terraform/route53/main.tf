locals {
  domain = "umihico.com"
}
resource "aws_route53_zone" "umihico_com" {
  comment = "HostedZone created by Route53 Registrar" # and imported
  name    = local.domain
}

resource "aws_route53_record" "gsuite_domain_vertification" {
  zone_id = aws_route53_zone.umihico_com.zone_id
  name    = local.domain
  type    = "TXT"
  ttl     = "300"
  records = [var.secret_google_txt]
}

resource "aws_route53_record" "gsuite_gmail_setup" {
  zone_id = aws_route53_zone.umihico_com.zone_id
  name    = local.domain
  type    = "MX"
  ttl     = 300
  records = [
    "1 aspmx.l.google.com",
    "5 alt1.aspmx.l.google.com",
    "5 alt2.aspmx.l.google.com",
    "10 alt3.aspmx.l.google.com",
    "10 alt4.aspmx.l.google.com"
  ]
}
