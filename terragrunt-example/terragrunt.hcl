terraform {
  source = ".//modules/multi-account-vpc"
}

generate "multi_account_providers" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
provider "aws" {
  alias  = "account_a"
  region = "us-east-1"

  assume_role {
    role_arn = "arn:aws:iam::673239105528:role/multi-provider-example"
  }

  default_tags {
    tags = {
      account = "Account A"
    }
  }
}

provider "aws" {
  alias  = "account_b"
  region = "us-east-2"

  assume_role {
    role_arn = "arn:aws:iam::673239105528:role/multi-provider-example"
  }

  default_tags {
    tags = {
      account = "Account B"
    }
  }
}
EOF
}

inputs = {}
