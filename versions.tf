## Place your Terraform Args / Provider version args here
terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "5.17.0"
    }
  }
}
