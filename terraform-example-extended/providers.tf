provider "aws" { // default provider
  region = var.default_region

  assume_role {
    role_arn = "arn:aws:iam::123456789012:role/allow-full-access-from-other-accounts"
  }
}

provider "aws" {
  alias  = "account_a"
  region = var.account_a_region

  assume_role {
    role_arn = "arn:aws:iam::123456789012:role/allow-full-access-from-other-accounts"
  }
}

provider "aws" {
  alias  = "account_b"
  region = var.account_b_region

  assume_role {
    role_arn = "arn:aws:iam::123456789012:role/allow-full-access-from-other-accounts"
  }
}

provider "aws" {
  alias  = "account_c"
  region = var.account_c_region

  assume_role {
    role_arn = "arn:aws:iam::123456789012:role/allow-full-access-from-other-accounts"
  }
}

provider "aws" {
  alias  = "account_d"
  region = var.account_d_region

  assume_role {
    role_arn = "arn:aws:iam::123456789012:role/allow-full-access-from-other-accounts"
  }
}
