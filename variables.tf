## Variables file

variable "github_org" {
  description = "GitHub organization name"
  default     = "hashicorp-demo-lab"
}

variable "github_org_owner" {
  description = "GitHub organization owner"
  default     = "hashicorp-demo-lab"
}

variable "github_repo_name" {
  description = "The name of the new repository"
  type        = string
}

variable "github_repo_desc" {
  description = "The description of the new repository"
  type        = string
  default     = "this repo was created by Terraform"
}


variable "github_repo_visibility" {
  description = "github repo visibility"
  type        = string
  default     = "public"
}

variable "github_team_name" {
  description = "github team name"
  default     = "demo-team"
}

variable "github_template_owner" {
  description = "The GitHub organization or user the template repository is owned by"
  default     = "hashicorp-demo-lab"
}

variable "github_repo_permission" {
  description = "Repository permission"
  default     = "admin"
}

variable "github_template_repo" {
  description = "The name of the repository template"
  default     = "terraform-template"
}

variable "github_template_include_branches" {
  description = "include all branches from github template"
  type        = bool
  default     = false
}
