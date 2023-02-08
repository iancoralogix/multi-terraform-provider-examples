terraform {
  required_providers {
    aws = {
      source                = "hashicorp/aws"
      version               = "~> 4.0"
      configuration_aliases = [aws.account_a, aws.account_b]
    }
  }
}

module "vpc_a" {
  source = "git@github.com:iangrunt/terraform-fake-modules.git//modules/aws/vpc?ref=main"

  providers = {
    aws = aws.account_a
  }
}

module "vpc_b" {
  source = "git@github.com:iangrunt/terraform-fake-modules.git//modules/aws/vpc?ref=main"

  providers = {
    aws = aws.account_b
  }
}
