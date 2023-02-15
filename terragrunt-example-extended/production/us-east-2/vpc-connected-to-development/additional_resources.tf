# Terragrunt's behavior pushes you to use reusable or child modules,
# and Terragrunt acts as a "super" root module. However, there is nothing
# stopping you from dropping arbitrary Terraform in here as well.

resource "null_resource" "this" {}

resource "null_resource" "that" {}
