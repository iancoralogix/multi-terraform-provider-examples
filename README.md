# Multi-provider Terraform and Terragrunt examples

### Overview
The two directories, `terraform-example`, and `terragrunt-example` show small examples of calling modules that expect more than one Terraform provider with `terraform` or `terragrunt`. It's advisable to use `aws-vault` when testing locally, and you should call a profile in your `aws-vault exec` that can assume both of those roles. Different approaches to authentication are outside of the scope of this example. The purpose is to show two basic ways to configure your root Terraform module or your monolithic Terragrunt module.
