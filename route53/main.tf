resource "aws_route53_zone" "umihico_com" {
  comment = "HostedZone created by Route53 Registrar" # and imported
  name    = "umihico.com"
}
