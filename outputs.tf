## Place your outputs here for your module

/* output "output-example" {
  value       = vault_policy.policies
  description = "Sample helm values file that contains all of the configured paths that were created with this module. This should be used a reference and not a raw input to another object"
} */


output "github_repo" {
  value = github_repository.new_repository.name
}

output "team_exists" {
  value = local.team_exists
} 