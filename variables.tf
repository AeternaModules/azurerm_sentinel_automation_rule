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
}

