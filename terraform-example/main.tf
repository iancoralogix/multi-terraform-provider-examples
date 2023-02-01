provider "aws" {
  alias  = "account_a"
  region = "us-east-1"

  assume_role {
    role_arn = "arn:aws:iam::123456789012:role/allow-full-access-from-other-accounts"
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
    role_arn = "arn:aws:iam::123456789012:role/allow-full-access-from-other-accounts"
  }

  default_tags {
    tags = {
      account = "Account B"
    }
  }
}

# Reusable module that expects two providers
module "multi_account_vpc" {
  source = "./modules/multi-account-vpc"

  providers = {
    aws.account_a = aws.account_a
    aws.account_b = aws.account_b
  }
}
