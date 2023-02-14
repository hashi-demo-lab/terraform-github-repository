## Variables file

variable "github_token" {
  description = "GitHub access token"
}

variable "org" {
  description = "GitHub organization name"
}

variable "repo_name" {
  description = "The name of the new repository"
}

variable "template_owner" {
  description = "The owner of the repository template"
}

variable "template_repo" {
  description = "The name of the repository template"
}
