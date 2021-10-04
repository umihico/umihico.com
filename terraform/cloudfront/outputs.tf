output "all" {
  value = {
    aws_route53_record_domains : aws_route53_record.domain,
    aws_s3_bucket_policy_static : aws_s3_bucket_policy.static,
  }
}
