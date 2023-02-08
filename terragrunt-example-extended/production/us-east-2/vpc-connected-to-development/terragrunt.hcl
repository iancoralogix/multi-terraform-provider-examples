terraform {
  # Go all the way up until you hit the root terragrunt.hcl, then go up
  # and over in the directory structure to find our modules directroy.
  source = "${dirname(find_in_parent_folders())}/modules/multi-account-vpc"
}

# Include all the configuration in the terragrunt.hcl
# in the root of this repository.
include "root" {
  path   = find_in_parent_folders()
  expose = true
}

locals {
  # Find the in directories above a file called
  # account.hcl that contains the AWS account ID
  # this module should be deployed in.
  account_info = read_terragrunt_config(find_in_parent_folders("account.hcl"))

  # Find the in directories above a file called
  # region.hcl that contains the name of the region
  # this module should be deployed in (it's us-east-2).
  region_info = read_terragrunt_config(find_in_parent_folders("region.hcl"))

  # Set some handy locals so we can use the shortform name.
  account_id = local.account_info.locals.account_id
  region     = local.region_info.locals.region

  # Pick where we want our destination to be on a module-by-module
  # basis, and use these values to  generate a providers.tf
  # on-the-fly that is only two blocks long. Hardcoded for each
  # specific target account we'd have, but the source account
  # configuration would be very DRY.
  target_region     = "us-east-1"
  target_account_id = "123456789012"

  # Select the aliases expected by the reusable module being called.
  # It is good to make this flexible as the module may change what's
  # expected from version to version and this way we can pin versions
  # safely as well as our provider configurations.
  source_account_provider_alias = "account_a"
  target_account_provider_alias = "account_b"
}

generate "multi_account_providers" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
provider "aws" {
  alias  = "${local.source_account_provider_alias}"
  region = "${local.region}"

  assume_role {
    role_arn = "arn:aws:iam::${local.account_id}:role/allow-full-access-from-other-accounts"
  }
}

provider "aws" {
  alias  = "${local.target_account_provider_alias}"
  region = "${local.target_region}"

  assume_role {
    role_arn = "arn:aws:iam::${local.target_account_id}:role/allow-full-access-from-other-accounts"
  }
}
EOF
}

inputs = {}
