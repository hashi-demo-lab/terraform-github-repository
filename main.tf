## Place all your terraform resources here
#  Locals at the top (if you are using them)
#  Data blocks next to resources that are referencing them
#  Reduce hard coded inputs where possible. They are used below for simplicity to show structure


# get all teams and lookup if existing
locals {
  team_exists = contains([for team in data.github_organization_teams.all.teams : team.name], var.github_team_name)
  teams       = [for team in data.github_organization_teams.all.teams : team if team.name == var.github_team_name]
  team_found  = length(local.teams) > 0 ? local.teams[0] : null
}

data "github_repository" "template" {
  full_name = "${var.github_org}/${var.github_template_repo}"
}

data "github_repository" "existing" {
  name = var.github_repo_name
}

#This should be removed from module and have as optional input - not efficient when using for_each on module
data "github_organization_teams" "all" {
  root_teams_only = true
  summary_only = true
}

resource "github_team" "new_team" {
  count = length(local.teams) > 0 ? 0 : 1
  name  = var.github_team_name
}

resource "github_repository" "new_repository" {
  name        = var.github_repo_name
  description = var.github_repo_desc
  visibility  = var.github_repo_visibility
  template {
    owner                = var.github_template_owner
    repository           = data.github_repository.template.id
    include_all_branches = var.github_template_include_branches
  }

  lifecycle {
    #depending on requirements this may need to change
    ignore_changes = all
  }

}

resource "github_team_repository" "team_repository_access" {
  team_id    = try(github_team.new_team[0].id, local.team_found.id)
  repository = try(github_repository.new_repository.name, data.github_repository.existing.name)
  permission = var.github_repo_permission
}
