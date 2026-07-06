output "stack_hci_deployment_settings" {
  description = "All stack_hci_deployment_setting resources"
  value       = azurerm_stack_hci_deployment_setting.stack_hci_deployment_settings
}
output "stack_hci_deployment_settings_arc_resource_ids" {
  description = "List of arc_resource_ids values across all stack_hci_deployment_settings"
  value       = [for k, v in azurerm_stack_hci_deployment_setting.stack_hci_deployment_settings : v.arc_resource_ids]
}
output "stack_hci_deployment_settings_scale_unit" {
  description = "List of scale_unit values across all stack_hci_deployment_settings"
  value       = [for k, v in azurerm_stack_hci_deployment_setting.stack_hci_deployment_settings : v.scale_unit]
}
output "stack_hci_deployment_settings_stack_hci_cluster_id" {
  description = "List of stack_hci_cluster_id values across all stack_hci_deployment_settings"
  value       = [for k, v in azurerm_stack_hci_deployment_setting.stack_hci_deployment_settings : v.stack_hci_cluster_id]
}
output "stack_hci_deployment_settings_version" {
  description = "List of version values across all stack_hci_deployment_settings"
  value       = [for k, v in azurerm_stack_hci_deployment_setting.stack_hci_deployment_settings : v.version]
}

