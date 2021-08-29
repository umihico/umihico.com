remote_state {
  backend = "s3"
  generate = {
    path              = "backend.tf"
    if_exists         = "overwrite"
    disable_signature = true
  }
  config = {
    region               = "ap-northeast-1"
    bucket               = "terraform-states-${get_aws_account_id()}"
    key                  = "${path_relative_to_include()}/terraform.tfstate"
    workspace_key_prefix = "workspaces"
    encrypt              = true
    dynamodb_table       = "terraform-lock-table-${get_aws_account_id()}"
    role_arn             = "${get_env("TERRAGRUNT_IAM_ROLE")}"
  }
}

generate "provider" {
  path              = "generated.tf"
  if_exists         = "overwrite"
  disable_signature = true
  contents          = <<EOF
provider "aws" {
  region = "ap-northeast-1"

  assume_role {
    role_arn     = "${get_env("TERRAGRUNT_IAM_ROLE")}"
  }
}
EOF
} 