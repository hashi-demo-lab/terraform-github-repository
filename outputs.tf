## Place your outputs here for your module

/* output "output-example" {
  value       = vault_policy.policies
  description = "Sample helm values file that contains all of the configured paths that were created with this module. This should be used a reference and not a raw input to another object"
} */


/* output "teams" {
  value = data.github_organization_teams.root_teams.teams
} */

output "team_exists" {
  value = local.team_exists
} 