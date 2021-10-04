output "all" {
  value = {
    aws_route53_zone_umihico_com : aws_route53_zone.umihico_com,
    aws_route53_record_gsuite_domain_vertification : aws_route53_record.gsuite_domain_vertification,
    aws_route53_record_gsuite_gmail_setup : aws_route53_record.gsuite_gmail_setup,
  }
}
