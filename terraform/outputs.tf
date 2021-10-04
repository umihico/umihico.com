output "all" {
  value = {
    route53 : module.route53.all,
    s3 : module.s3.all,
    acm_us_east_1 : module.acm_us_east_1.all,
    cloudfront : module.cloudfront.all,
  }
}
