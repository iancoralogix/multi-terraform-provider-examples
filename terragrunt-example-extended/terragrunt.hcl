generate "default-provider" {
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
# generate "backend-for-state" {...}
# generate "helm-provider" {...}
# include "global-values" {...}
