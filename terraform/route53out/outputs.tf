data "aws_caller_identity" "self" {}

data "terraform_remote_state" "zones" {
  backend = "s3"
  config = {
    bucket = "terraform-states-${data.aws_caller_identity.self.account_id}"
    key    = "route53/terraform.tfstate"
    region = "ap-northeast-1"
  }
}

output "all" {
  value = data.terraform_remote_state.zones.outputs.all
}
