generate "default_provider" {
  path      = "default_provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
provider "aws" {
  region = "us-east-1"

  assume_role {
    role_arn = "arn:aws:iam::123456789012:role/allow-full-access-from-other-accounts"
  }
}
EOF
}

# Some other things we'd do in this file:
# generate "s3_backend" {...}
# generate "helm_provider" {...}
# include "global_values" {...}
