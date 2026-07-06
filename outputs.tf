output "sentinel_automation_rules" {
  description = "All sentinel_automation_rule resources"
  value       = azurerm_sentinel_automation_rule.sentinel_automation_rules
}
output "sentinel_automation_rules_action_incident" {
  description = "List of action_incident values across all sentinel_automation_rules"
  value       = [for k, v in azurerm_sentinel_automation_rule.sentinel_automation_rules : v.action_incident]
}
output "sentinel_automation_rules_action_incident_task" {
  description = "List of action_incident_task values across all sentinel_automation_rules"
  value       = [for k, v in azurerm_sentinel_automation_rule.sentinel_automation_rules : v.action_incident_task]
}
output "sentinel_automation_rules_action_playbook" {
  description = "List of action_playbook values across all sentinel_automation_rules"
  value       = [for k, v in azurerm_sentinel_automation_rule.sentinel_automation_rules : v.action_playbook]
}
output "sentinel_automation_rules_condition_json" {
  description = "List of condition_json values across all sentinel_automation_rules"
  value       = [for k, v in azurerm_sentinel_automation_rule.sentinel_automation_rules : v.condition_json]
}
output "sentinel_automation_rules_display_name" {
  description = "List of display_name values across all sentinel_automation_rules"
  value       = [for k, v in azurerm_sentinel_automation_rule.sentinel_automation_rules : v.display_name]
}
output "sentinel_automation_rules_enabled" {
  description = "List of enabled values across all sentinel_automation_rules"
  value       = [for k, v in azurerm_sentinel_automation_rule.sentinel_automation_rules : v.enabled]
}
output "sentinel_automation_rules_expiration" {
  description = "List of expiration values across all sentinel_automation_rules"
  value       = [for k, v in azurerm_sentinel_automation_rule.sentinel_automation_rules : v.expiration]
}
output "sentinel_automation_rules_log_analytics_workspace_id" {
  description = "List of log_analytics_workspace_id values across all sentinel_automation_rules"
  value       = [for k, v in azurerm_sentinel_automation_rule.sentinel_automation_rules : v.log_analytics_workspace_id]
}
output "sentinel_automation_rules_name" {
  description = "List of name values across all sentinel_automation_rules"
  value       = [for k, v in azurerm_sentinel_automation_rule.sentinel_automation_rules : v.name]
}
output "sentinel_automation_rules_order" {
  description = "List of order values across all sentinel_automation_rules"
  value       = [for k, v in azurerm_sentinel_automation_rule.sentinel_automation_rules : v.order]
}
output "sentinel_automation_rules_triggers_on" {
  description = "List of triggers_on values across all sentinel_automation_rules"
  value       = [for k, v in azurerm_sentinel_automation_rule.sentinel_automation_rules : v.triggers_on]
}
output "sentinel_automation_rules_triggers_when" {
  description = "List of triggers_when values across all sentinel_automation_rules"
  value       = [for k, v in azurerm_sentinel_automation_rule.sentinel_automation_rules : v.triggers_when]
}

