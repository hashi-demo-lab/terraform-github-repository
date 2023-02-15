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
  full_name  = concat(var.org, ""/"", var.repo_name)
}

data "github_repository" "existing_repository" {
  name = var.repo_name
}

data "github_team" "existing_team" {
  name = var.team_name
}

resource "github_team" "new_team" {
  name = var.team_name

  # Ensure that the team doesn't already exist
  count = data.github_team.existing_team.name == var.team_name ? 0 : 1
}


resource "github_repository" "new_repository" {
  # Ensure that the repository doesn't already exist
  count = data.github_repository.existing_repository.name == var.repo_name ? 0 : 1

  name = var.repo_name
  description = "New repository created from template"
  
  template {
    owner = var.template_owner
    repository = data.github_repository.template.id
    include_all_branches = var.template_include_branches
  }
  owner       = var.org
}


resource "github_team_repository" "team_repository_access" {
  team_id    = try( github_team.new_team.id , data.github_team.existing_team.id)
  repository = try( github_repository.new_repository.name, data.github_repository.existing_repository.name)
  permission = var.permission
}
