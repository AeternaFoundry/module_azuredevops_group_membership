resource "azuredevops_group_membership" "group_memberships" {
  for_each = var.group_memberships

  group   = each.value.group
  members = each.value.members
  mode    = each.value.mode

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      read   = timeouts.value.read
      update = timeouts.value.update
    }
  }
}

