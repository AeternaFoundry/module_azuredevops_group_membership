variable "group_memberships" {
  description = <<EOT
Map of group_memberships, attributes below
Required:
    - group
    - members
Optional:
    - mode
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - read (optional)
        - update (optional)
EOT

  type = map(object({
    group   = string
    members = set(string)
    mode    = optional(string)
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      read   = optional(string)
      update = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.group_memberships : (
        length(v.group) > 0
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.group_memberships : (
        v.mode == null || (contains([for v in ["add", "overwrite"] : lower(v)], lower(v.mode)))
      )
    ])
    error_message = "must be one of: \"add\", \"overwrite\""
  }
  validation {
    condition = alltrue([
      for k, v in var.group_memberships : (
        alltrue([for x in v.members : length(x) > 0])
      )
    ])
    error_message = "must not be empty"
  }
}

