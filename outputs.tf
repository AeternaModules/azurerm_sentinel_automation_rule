output "sentinel_automation_rules_id" {
  description = "Map of id values across all sentinel_automation_rules, keyed the same as var.sentinel_automation_rules"
  value       = { for k, v in azurerm_sentinel_automation_rule.sentinel_automation_rules : k => v.id }
}
output "sentinel_automation_rules_action_incident" {
  description = "Map of action_incident values across all sentinel_automation_rules, keyed the same as var.sentinel_automation_rules"
  value       = { for k, v in azurerm_sentinel_automation_rule.sentinel_automation_rules : k => v.action_incident }
}
output "sentinel_automation_rules_action_incident_task" {
  description = "Map of action_incident_task values across all sentinel_automation_rules, keyed the same as var.sentinel_automation_rules"
  value       = { for k, v in azurerm_sentinel_automation_rule.sentinel_automation_rules : k => v.action_incident_task }
}
output "sentinel_automation_rules_action_playbook" {
  description = "Map of action_playbook values across all sentinel_automation_rules, keyed the same as var.sentinel_automation_rules"
  value       = { for k, v in azurerm_sentinel_automation_rule.sentinel_automation_rules : k => v.action_playbook }
}
output "sentinel_automation_rules_condition_json" {
  description = "Map of condition_json values across all sentinel_automation_rules, keyed the same as var.sentinel_automation_rules"
  value       = { for k, v in azurerm_sentinel_automation_rule.sentinel_automation_rules : k => v.condition_json }
}
output "sentinel_automation_rules_display_name" {
  description = "Map of display_name values across all sentinel_automation_rules, keyed the same as var.sentinel_automation_rules"
  value       = { for k, v in azurerm_sentinel_automation_rule.sentinel_automation_rules : k => v.display_name }
}
output "sentinel_automation_rules_enabled" {
  description = "Map of enabled values across all sentinel_automation_rules, keyed the same as var.sentinel_automation_rules"
  value       = { for k, v in azurerm_sentinel_automation_rule.sentinel_automation_rules : k => v.enabled }
}
output "sentinel_automation_rules_expiration" {
  description = "Map of expiration values across all sentinel_automation_rules, keyed the same as var.sentinel_automation_rules"
  value       = { for k, v in azurerm_sentinel_automation_rule.sentinel_automation_rules : k => v.expiration }
}
output "sentinel_automation_rules_log_analytics_workspace_id" {
  description = "Map of log_analytics_workspace_id values across all sentinel_automation_rules, keyed the same as var.sentinel_automation_rules"
  value       = { for k, v in azurerm_sentinel_automation_rule.sentinel_automation_rules : k => v.log_analytics_workspace_id }
}
output "sentinel_automation_rules_name" {
  description = "Map of name values across all sentinel_automation_rules, keyed the same as var.sentinel_automation_rules"
  value       = { for k, v in azurerm_sentinel_automation_rule.sentinel_automation_rules : k => v.name }
}
output "sentinel_automation_rules_order" {
  description = "Map of order values across all sentinel_automation_rules, keyed the same as var.sentinel_automation_rules"
  value       = { for k, v in azurerm_sentinel_automation_rule.sentinel_automation_rules : k => v.order }
}
output "sentinel_automation_rules_triggers_on" {
  description = "Map of triggers_on values across all sentinel_automation_rules, keyed the same as var.sentinel_automation_rules"
  value       = { for k, v in azurerm_sentinel_automation_rule.sentinel_automation_rules : k => v.triggers_on }
}
output "sentinel_automation_rules_triggers_when" {
  description = "Map of triggers_when values across all sentinel_automation_rules, keyed the same as var.sentinel_automation_rules"
  value       = { for k, v in azurerm_sentinel_automation_rule.sentinel_automation_rules : k => v.triggers_when }
}

