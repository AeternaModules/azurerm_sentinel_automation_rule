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
    enabled                    = optional(bool) # Default: true
    expiration                 = optional(string)
    triggers_on                = optional(string) # Default: "Incidents"
    triggers_when              = optional(string) # Default: "Created"
    action_incident = optional(object({
      classification         = optional(string)
      classification_comment = optional(string)
      labels                 = optional(list(string))
      order                  = number
      owner_id               = optional(string)
      severity               = optional(string)
      status                 = optional(string)
    }))
    action_incident_task = optional(object({
      description = optional(string)
      order       = number
      title       = string
    }))
    action_playbook = optional(object({
      logic_app_id = string
      order        = number
      tenant_id    = optional(string)
    }))
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
        v.action_incident_task == null || (v.action_incident_task.order >= 0)
      )
    ])
    error_message = "must be at least 0"
  }
  validation {
    condition = alltrue([
      for k, v in var.sentinel_automation_rules : (
        v.action_incident_task == null || (length(v.action_incident_task.title) > 0)
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.sentinel_automation_rules : (
        v.action_incident_task == null || (v.action_incident_task.description == null || (length(v.action_incident_task.description) > 0))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.sentinel_automation_rules : (
        v.action_incident == null || (v.action_incident.order >= 0)
      )
    ])
    error_message = "must be at least 0"
  }
  validation {
    condition = alltrue([
      for k, v in var.sentinel_automation_rules : (
        v.action_incident == null || (v.action_incident.classification_comment == null || (length(v.action_incident.classification_comment) > 0))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.sentinel_automation_rules : (
        v.action_incident == null || (v.action_incident.owner_id == null || (length(v.action_incident.owner_id) > 0))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.sentinel_automation_rules : (
        v.action_playbook == null || (v.action_playbook.order >= 0)
      )
    ])
    error_message = "must be at least 0"
  }
  validation {
    condition = alltrue([
      for k, v in var.sentinel_automation_rules : (
        v.action_playbook == null || (v.action_playbook.tenant_id == null || (can(regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$", v.action_playbook.tenant_id))))
      )
    ])
    error_message = "must be a valid UUID"
  }
  # --- Unconfirmed validation candidates, derived from azurerm_sentinel_automation_rule's provider source ---
  # Not auto-enabled: either a bespoke provider validator we can't safely translate,
  # or a path that crosses a list-typed block (needs its own for_each wrapping).
  # Review, translate into a real validation{} block above, and delete once confirmed.
  # path: log_analytics_workspace_id
  #   source:    [from automationrules.ValidateWorkspaceID] !ok
  # path: log_analytics_workspace_id
  #   source:    [from automationrules.ValidateWorkspaceID] err != nil
  # path: triggers_on
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: triggers_when
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: expiration
  #   source:    validation.IsRFC3339Time(...) - no translation rule yet, add one
  # path: condition_json
  #   source:    validation.StringIsJSON(...) - no translation rule yet, add one
  # path: action_incident.status
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: action_incident.classification
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: action_incident.severity
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: action_playbook.logic_app_id
  #   source:    [from workflows.ValidateWorkflowID] !ok
  # path: action_playbook.logic_app_id
  #   source:    [from workflows.ValidateWorkflowID] err != nil
}

