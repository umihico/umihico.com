module "route53" {
  source = "./route53out"
}

module "s3" {
  source = "./s3"
}

module "acm_us_east_1" {
  source = "./acm"
  vars   = { route53 : module.route53.all }
  providers = {
    aws = aws.use1
  }
}

module "cloudfront" {
  source = "./cloudfront"
  vars = {
    route53 : module.route53.all,
    s3 : module.s3.all,
    acm_us_east_1 : module.acm_us_east_1.all,
  }
}
