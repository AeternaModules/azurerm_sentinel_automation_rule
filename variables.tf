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
  # --- Unconfirmed validation candidates, derived from azurerm_sentinel_automation_rule's provider source ---
  # Not auto-enabled: either a bespoke provider validator we can't safely translate,
  # or a path that crosses a list-typed block (needs its own for_each wrapping).
  # Review, translate into a real validation{} block above, and delete once confirmed.
  # path: name
  #   condition: can(regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$", value))
  #   message:   must be a valid UUID
  # path: log_analytics_workspace_id
  #   source:    [from automationrules.ValidateWorkspaceID] !ok
  # path: log_analytics_workspace_id
  #   source:    [from automationrules.ValidateWorkspaceID] err != nil
  # path: display_name
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: order
  #   condition: value >= 1 && value <= 1000
  #   message:   must be between 1 and 1000
  # path: triggers_on
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: triggers_when
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: expiration
  #   source:    validation.IsRFC3339Time(...) - no translation rule yet, add one
  # path: condition_json
  #   source:    validation.StringIsJSON(...) - no translation rule yet, add one
  # path: action_incident_task.order
  #   condition: value >= 0
  #   message:   must be at least 0
  # path: action_incident_task.title
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: action_incident_task.description
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: action_incident.order
  #   condition: value >= 0
  #   message:   must be at least 0
  # path: action_incident.status
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: action_incident.classification
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: action_incident.classification_comment
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: action_incident.owner_id
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: action_incident.severity
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: action_playbook.order
  #   condition: value >= 0
  #   message:   must be at least 0
  # path: action_playbook.logic_app_id
  #   source:    [from workflows.ValidateWorkflowID] !ok
  # path: action_playbook.logic_app_id
  #   source:    [from workflows.ValidateWorkflowID] err != nil
  # path: action_playbook.tenant_id
  #   condition: can(regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$", value))
  #   message:   must be a valid UUID
}

