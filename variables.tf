variable "sentinel_automation_rules" {
  description = <<EOT
Map of sentinel_automation_rules, attributes below
Required:
    - display_name
    - log_analytics_workspace_id
    - name
    - order
Optional:
    - condition_json
    - enabled
    - expiration
    - triggers_on
    - triggers_when
    - action_incident (block):
        - classification (optional)
        - classification_comment (optional)
        - labels (optional)
        - order (required)
        - owner_id (optional)
        - severity (optional)
        - status (optional)
    - action_incident_task (block):
        - description (optional)
        - order (required)
        - title (required)
    - action_playbook (block):
        - logic_app_id (required)
        - order (required)
        - tenant_id (optional)
EOT

  type = map(object({
    display_name               = string
    log_analytics_workspace_id = string
    name                       = string
    order                      = number
    condition_json             = optional(string)
    enabled                    = optional(bool)
    expiration                 = optional(string)
    triggers_on                = optional(string)
    triggers_when              = optional(string)
    action_incident = optional(list(object({
      classification         = optional(string)
      classification_comment = optional(string)
      labels                 = optional(list(string))
      order                  = number
      owner_id               = optional(string)
      severity               = optional(string)
      status                 = optional(string)
    })))
    action_incident_task = optional(list(object({
      description = optional(string)
      order       = number
      title       = string
    })))
    action_playbook = optional(list(object({
      logic_app_id = string
      order        = number
      tenant_id    = optional(string)
    })))
  }))
  validation {
    condition = alltrue([
      for k, v in var.sentinel_automation_rules : (
        can(regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$", v.name))
      )
    ])
    error_message = "must be a valid UUID"
  }
  validation {
    condition = alltrue([
      for k, v in var.sentinel_automation_rules : (
        length(v.display_name) > 0
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.sentinel_automation_rules : (
        v.order >= 1 && v.order <= 1000
      )
    ])
    error_message = "must be between 1 and 1000"
  }
  validation {
    condition = alltrue([
      for k, v in var.sentinel_automation_rules : (
        v.condition_json == null || (can(jsondecode(v.condition_json)))
      )
    ])
    error_message = "must be valid JSON"
  }
  validation {
    condition = alltrue([
      for k, v in var.sentinel_automation_rules : (
        v.action_incident_task == null || alltrue([for item in v.action_incident_task : (item.order >= 0)])
      )
    ])
    error_message = "must be at least 0"
  }
  validation {
    condition = alltrue([
      for k, v in var.sentinel_automation_rules : (
        v.action_incident_task == null || alltrue([for item in v.action_incident_task : (length(item.title) > 0)])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.sentinel_automation_rules : (
        v.action_incident_task == null || alltrue([for item in v.action_incident_task : (item.description == null || (length(item.description) > 0))])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.sentinel_automation_rules : (
        v.action_incident == null || alltrue([for item in v.action_incident : (item.order >= 0)])
      )
    ])
    error_message = "must be at least 0"
  }
  validation {
    condition = alltrue([
      for k, v in var.sentinel_automation_rules : (
        v.action_incident == null || alltrue([for item in v.action_incident : (item.classification_comment == null || (length(item.classification_comment) > 0))])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.sentinel_automation_rules : (
        v.action_incident == null || alltrue([for item in v.action_incident : (item.owner_id == null || (length(item.owner_id) > 0))])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.sentinel_automation_rules : (
        v.action_playbook == null || alltrue([for item in v.action_playbook : (item.order >= 0)])
      )
    ])
    error_message = "must be at least 0"
  }
  validation {
    condition = alltrue([
      for k, v in var.sentinel_automation_rules : (
        v.action_playbook == null || alltrue([for item in v.action_playbook : (item.tenant_id == null || (can(regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$", item.tenant_id))))])
      )
    ])
    error_message = "must be a valid UUID"
  }
  # Note: 10 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

