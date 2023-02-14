## Place all your terraform resources here
#  Locals at the top (if you are using them)
#  Data blocks next to resources that are referencing them
#  Reduce hard coded inputs where possible. They are used below for simplicity to show structure

/* local {
  # Local that is a map that is used for something
  example-local {
    key = value
  }
}*/


data "github_repository" "template" {
  owner = var.template_owner
  name  = var.template_repo
}

resource "github_repository" "example" {
  name        = var.repo_name
  description = "New repository created from template"
  template_repository {
    repository_id = data.github_repository.template.id
  }
  owner       = var.org
}
