variable "default_region" {
  default = "us-east-1"
}

variable "account_a_region" {
  default = "us-east-1"
}

variable "account_b_region" {
  default = "us-east-1"
}

variable "account_c_region" {
  default = "us-east-1"
}

variable "account_d_region" {
  default = "us-east-1"
}

# Reusable module that expects two providers
module "multi_account_vpc_group_1" {
  source = "./modules/multi-account-vpc"

  providers = {
    aws.account_a = aws.account_a
    aws.account_b = aws.account_b
  }
}

module "multi_account_vpc_group_2" {
  source = "./modules/multi-account-vpc"

  providers = {
    aws.account_a = aws.account_c
    aws.account_b = aws.account_d
  }
}

module "multi_account_vpc_group_3" {
  source = "./modules/multi-account-vpc"

  providers = {
    aws.account_a = aws.account_a
    aws.account_b = aws.account_c
  }
}

module "multi_account_vpc_group_4" {
  source = "./modules/multi-account-vpc"

  providers = {
    aws.account_a = aws.account_b
    aws.account_b = aws.account_d
  }
}
