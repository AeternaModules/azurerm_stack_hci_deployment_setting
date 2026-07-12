output "stack_hci_deployment_settings_id" {
  description = "Map of id values across all stack_hci_deployment_settings, keyed the same as var.stack_hci_deployment_settings"
  value       = { for k, v in azurerm_stack_hci_deployment_setting.stack_hci_deployment_settings : k => v.id }
}
output "stack_hci_deployment_settings_arc_resource_ids" {
  description = "Map of arc_resource_ids values across all stack_hci_deployment_settings, keyed the same as var.stack_hci_deployment_settings"
  value       = { for k, v in azurerm_stack_hci_deployment_setting.stack_hci_deployment_settings : k => v.arc_resource_ids }
}
output "stack_hci_deployment_settings_scale_unit" {
  description = "Map of scale_unit values across all stack_hci_deployment_settings, keyed the same as var.stack_hci_deployment_settings"
  value       = { for k, v in azurerm_stack_hci_deployment_setting.stack_hci_deployment_settings : k => v.scale_unit }
}
output "stack_hci_deployment_settings_stack_hci_cluster_id" {
  description = "Map of stack_hci_cluster_id values across all stack_hci_deployment_settings, keyed the same as var.stack_hci_deployment_settings"
  value       = { for k, v in azurerm_stack_hci_deployment_setting.stack_hci_deployment_settings : k => v.stack_hci_cluster_id }
}
output "stack_hci_deployment_settings_version" {
  description = "Map of version values across all stack_hci_deployment_settings, keyed the same as var.stack_hci_deployment_settings"
  value       = { for k, v in azurerm_stack_hci_deployment_setting.stack_hci_deployment_settings : k => v.version }
}

