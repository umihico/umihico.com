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
    key                  = "terraform.tfstate"
    workspace_key_prefix = "workspaces"
    encrypt              = true
    dynamodb_table       = "terraform-lock-table-${get_aws_account_id()}"
  }
}

generate "provider" {
  path              = "generated.tf"
  if_exists         = "overwrite"
  disable_signature = true
  contents          = <<EOF
provider "aws" {
  region = "ap-northeast-1"
}
EOF
} 