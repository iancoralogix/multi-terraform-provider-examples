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
