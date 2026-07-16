output "stack_hci_deployment_settings_id" {
  description = "Map of id values across all stack_hci_deployment_settings, keyed the same as var.stack_hci_deployment_settings"
  value       = { for k, v in azurerm_stack_hci_deployment_setting.stack_hci_deployment_settings : k => v.id if v.id != null && length(v.id) > 0 }
}
output "stack_hci_deployment_settings_arc_resource_ids" {
  description = "Map of arc_resource_ids values across all stack_hci_deployment_settings, keyed the same as var.stack_hci_deployment_settings"
  value       = { for k, v in azurerm_stack_hci_deployment_setting.stack_hci_deployment_settings : k => v.arc_resource_ids if v.arc_resource_ids != null && length(v.arc_resource_ids) > 0 }
}
output "stack_hci_deployment_settings_scale_unit" {
  description = "Map of scale_unit values across all stack_hci_deployment_settings, keyed the same as var.stack_hci_deployment_settings"
  value       = { for k, v in azurerm_stack_hci_deployment_setting.stack_hci_deployment_settings : k => v.scale_unit if v.scale_unit != null && length(v.scale_unit) > 0 }
}
output "stack_hci_deployment_settings_stack_hci_cluster_id" {
  description = "Map of stack_hci_cluster_id values across all stack_hci_deployment_settings, keyed the same as var.stack_hci_deployment_settings"
  value       = { for k, v in azurerm_stack_hci_deployment_setting.stack_hci_deployment_settings : k => v.stack_hci_cluster_id if v.stack_hci_cluster_id != null && length(v.stack_hci_cluster_id) > 0 }
}
output "stack_hci_deployment_settings_version" {
  description = "Map of version values across all stack_hci_deployment_settings, keyed the same as var.stack_hci_deployment_settings"
  value       = { for k, v in azurerm_stack_hci_deployment_setting.stack_hci_deployment_settings : k => v.version if v.version != null && length(v.version) > 0 }
}

