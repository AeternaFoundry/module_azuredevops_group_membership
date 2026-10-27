output "group_memberships_id" {
  description = "Map of id values across all group_memberships, keyed the same as var.group_memberships"
  value       = { for k, v in azuredevops_group_membership.group_memberships : k => v.id }
}
output "group_memberships_group" {
  description = "Map of group values across all group_memberships, keyed the same as var.group_memberships"
  value       = { for k, v in azuredevops_group_membership.group_memberships : k => v.group }
}
output "group_memberships_members" {
  description = "Map of members values across all group_memberships, keyed the same as var.group_memberships"
  value       = { for k, v in azuredevops_group_membership.group_memberships : k => v.members }
}
output "group_memberships_mode" {
  description = "Map of mode values across all group_memberships, keyed the same as var.group_memberships"
  value       = { for k, v in azuredevops_group_membership.group_memberships : k => v.mode }
}

