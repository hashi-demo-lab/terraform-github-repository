## Variables file

variable "github_token" {
  description = "GitHub access token"
  sensitive = true
}

variable "github_org" {
  description = "GitHub organization name"
  default = "hashicorp-demo-lab"
}

variable "github_repo_name" {
  description = "The name of the new repository"
  type        = string
}

variable "github_team_name" {
  description = "github team name"
  default = "demo team"
}

variable "github_template_owner" {
  description = "The GitHub organization or user the template repository is owned by"
  default = "hashicorp-demo-lab"
}

variable "github_repo_permission" {
  description = "Repository permission"
  default = "admin"
}

variable "github_template_repo" {
  description = "The name of the repository template"
  default = ""
}

variable "github_template_include_branches" {
  description = "include all branches from github template"
  type        = bool
  default = false
}
