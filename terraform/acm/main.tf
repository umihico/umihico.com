terraform {
  required_version = ">= 0.13.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

module "acm" {
  source      = "terraform-aws-modules/acm/aws"
  domain_name = var.vars.route53.aws_route53_zone_umihico_com.name
  zone_id     = var.vars.route53.aws_route53_zone_umihico_com.id

  subject_alternative_names = [
    "*.${var.vars.route53.aws_route53_zone_umihico_com.name}",
  ]
  wait_for_validation = true
}
