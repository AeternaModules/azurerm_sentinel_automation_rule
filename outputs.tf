output "sentinel_automation_rules_id" {
  description = "Map of id values across all sentinel_automation_rules, keyed the same as var.sentinel_automation_rules"
  value       = { for k, v in azurerm_sentinel_automation_rule.sentinel_automation_rules : k => v.id if v.id != null && length(v.id) > 0 }
}
output "sentinel_automation_rules_action_incident" {
  description = "Map of action_incident values across all sentinel_automation_rules, keyed the same as var.sentinel_automation_rules"
  value       = { for k, v in azurerm_sentinel_automation_rule.sentinel_automation_rules : k => v.action_incident if v.action_incident != null && length(v.action_incident) > 0 }
}
output "sentinel_automation_rules_action_incident_task" {
  description = "Map of action_incident_task values across all sentinel_automation_rules, keyed the same as var.sentinel_automation_rules"
  value       = { for k, v in azurerm_sentinel_automation_rule.sentinel_automation_rules : k => v.action_incident_task if v.action_incident_task != null && length(v.action_incident_task) > 0 }
}
output "sentinel_automation_rules_action_playbook" {
  description = "Map of action_playbook values across all sentinel_automation_rules, keyed the same as var.sentinel_automation_rules"
  value       = { for k, v in azurerm_sentinel_automation_rule.sentinel_automation_rules : k => v.action_playbook if v.action_playbook != null && length(v.action_playbook) > 0 }
}
output "sentinel_automation_rules_condition_json" {
  description = "Map of condition_json values across all sentinel_automation_rules, keyed the same as var.sentinel_automation_rules"
  value       = { for k, v in azurerm_sentinel_automation_rule.sentinel_automation_rules : k => v.condition_json if v.condition_json != null && length(v.condition_json) > 0 }
}
output "sentinel_automation_rules_display_name" {
  description = "Map of display_name values across all sentinel_automation_rules, keyed the same as var.sentinel_automation_rules"
  value       = { for k, v in azurerm_sentinel_automation_rule.sentinel_automation_rules : k => v.display_name if v.display_name != null && length(v.display_name) > 0 }
}
output "sentinel_automation_rules_enabled" {
  description = "Map of enabled values across all sentinel_automation_rules, keyed the same as var.sentinel_automation_rules"
  value       = { for k, v in azurerm_sentinel_automation_rule.sentinel_automation_rules : k => v.enabled if v.enabled != null }
}
output "sentinel_automation_rules_expiration" {
  description = "Map of expiration values across all sentinel_automation_rules, keyed the same as var.sentinel_automation_rules"
  value       = { for k, v in azurerm_sentinel_automation_rule.sentinel_automation_rules : k => v.expiration if v.expiration != null && length(v.expiration) > 0 }
}
output "sentinel_automation_rules_log_analytics_workspace_id" {
  description = "Map of log_analytics_workspace_id values across all sentinel_automation_rules, keyed the same as var.sentinel_automation_rules"
  value       = { for k, v in azurerm_sentinel_automation_rule.sentinel_automation_rules : k => v.log_analytics_workspace_id if v.log_analytics_workspace_id != null && length(v.log_analytics_workspace_id) > 0 }
}
output "sentinel_automation_rules_name" {
  description = "Map of name values across all sentinel_automation_rules, keyed the same as var.sentinel_automation_rules"
  value       = { for k, v in azurerm_sentinel_automation_rule.sentinel_automation_rules : k => v.name if v.name != null && length(v.name) > 0 }
}
output "sentinel_automation_rules_order" {
  description = "Map of order values across all sentinel_automation_rules, keyed the same as var.sentinel_automation_rules"
  value       = { for k, v in azurerm_sentinel_automation_rule.sentinel_automation_rules : k => v.order if v.order != null }
}
output "sentinel_automation_rules_triggers_on" {
  description = "Map of triggers_on values across all sentinel_automation_rules, keyed the same as var.sentinel_automation_rules"
  value       = { for k, v in azurerm_sentinel_automation_rule.sentinel_automation_rules : k => v.triggers_on if v.triggers_on != null && length(v.triggers_on) > 0 }
}
output "sentinel_automation_rules_triggers_when" {
  description = "Map of triggers_when values across all sentinel_automation_rules, keyed the same as var.sentinel_automation_rules"
  value       = { for k, v in azurerm_sentinel_automation_rule.sentinel_automation_rules : k => v.triggers_when if v.triggers_when != null && length(v.triggers_when) > 0 }
}

