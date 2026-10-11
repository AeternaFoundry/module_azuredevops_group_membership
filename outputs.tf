output "group_memberships_id" {
  description = "Map of id values across all group_memberships, keyed the same as var.group_memberships except keys with no id are omitted"
  value       = { for k, v in azuredevops_group_membership.group_memberships : k => v.id if v.id != null && length(v.id) > 0 }
}
output "group_memberships_group" {
  description = "Map of group values across all group_memberships, keyed the same as var.group_memberships except keys with no group are omitted"
  value       = { for k, v in azuredevops_group_membership.group_memberships : k => v.group if v.group != null && length(v.group) > 0 }
}
output "group_memberships_members" {
  description = "Map of members values across all group_memberships, keyed the same as var.group_memberships except keys with no members are omitted"
  value       = { for k, v in azuredevops_group_membership.group_memberships : k => v.members if v.members != null && length(v.members) > 0 }
}
output "group_memberships_mode" {
  description = "Map of mode values across all group_memberships, keyed the same as var.group_memberships except keys with no mode are omitted"
  value       = { for k, v in azuredevops_group_membership.group_memberships : k => v.mode if v.mode != null && length(v.mode) > 0 }
}

