module "distribution" {
  source = "terraform-aws-modules/cloudfront/aws"

  aliases = [var.vars.route53.aws_route53_zone_umihico_com.name]

  enabled             = true
  is_ipv6_enabled     = true
  price_class         = "PriceClass_All"
  retain_on_delete    = false
  wait_for_deployment = false

  create_origin_access_identity = true
  origin_access_identities = {
    s3bucket = "access-identity" # whatever
  }

  origin = {
    s3assets = {
      domain_name = var.vars.s3.aws_s3_bucket_static.bucket_regional_domain_name
      s3_origin_config = {
        origin_access_identity = "s3bucket"
      }
    }
  }

  default_cache_behavior = {
    target_origin_id       = "s3assets"
    viewer_protocol_policy = "redirect-to-https"
    allowed_methods        = ["GET", "HEAD"]
    cached_methods         = ["GET", "HEAD"]
    compress               = true
    query_string           = false
    use_forwarded_values   = true
    headers                = []
    cookies_forward        = "none"
  }

  ordered_cache_behavior = []

  viewer_certificate = {
    acm_certificate_arn = var.vars.acm_us_east_1.acm_certificate_arn
    ssl_support_method  = "sni-only"
  }
}

resource "aws_route53_record" "domain" {
  name    = var.vars.route53.aws_route53_zone_umihico_com.name
  zone_id = var.vars.route53.aws_route53_zone_umihico_com.id
  type    = "A"
  alias {
    name                   = module.distribution.cloudfront_distribution_domain_name
    zone_id                = module.distribution.cloudfront_distribution_hosted_zone_id
    evaluate_target_health = true
  }
}

data "aws_iam_policy_document" "static" {
  statement {
    actions   = ["s3:GetObject"]
    resources = ["${var.vars.s3.aws_s3_bucket_static.arn}/*"]

    principals {
      type        = "AWS"
      identifiers = [module.distribution.cloudfront_origin_access_identities.s3bucket.iam_arn]
    }
  }
}

resource "aws_s3_bucket_policy" "static" {
  bucket = var.vars.s3.aws_s3_bucket_static.id
  policy = data.aws_iam_policy_document.static.json
}
