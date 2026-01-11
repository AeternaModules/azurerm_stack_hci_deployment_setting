resource "azurerm_stack_hci_deployment_setting" "stack_hci_deployment_settings" {
  for_each = var.stack_hci_deployment_settings

  arc_resource_ids     = each.value.arc_resource_ids
  stack_hci_cluster_id = each.value.stack_hci_cluster_id
  version              = each.value.version

  scale_unit {
    active_directory_organizational_unit_path = each.value.scale_unit.active_directory_organizational_unit_path
    bitlocker_boot_volume_enabled             = each.value.scale_unit.bitlocker_boot_volume_enabled
    bitlocker_data_volume_enabled             = each.value.scale_unit.bitlocker_data_volume_enabled
    cluster {
      azure_service_endpoint = each.value.scale_unit.cluster.azure_service_endpoint
      cloud_account_name     = each.value.scale_unit.cluster.cloud_account_name
      name                   = each.value.scale_unit.cluster.name
      witness_path           = each.value.scale_unit.cluster.witness_path
      witness_type           = each.value.scale_unit.cluster.witness_type
    }
    credential_guard_enabled     = each.value.scale_unit.credential_guard_enabled
    domain_fqdn                  = each.value.scale_unit.domain_fqdn
    drift_control_enabled        = each.value.scale_unit.drift_control_enabled
    drtm_protection_enabled      = each.value.scale_unit.drtm_protection_enabled
    episodic_data_upload_enabled = each.value.scale_unit.episodic_data_upload_enabled
    eu_location_enabled          = each.value.scale_unit.eu_location_enabled
    host_network {
      intent {
        adapter = each.value.scale_unit.host_network.intent.adapter
        dynamic "adapter_property_override" {
          for_each = each.value.scale_unit.host_network.intent.adapter_property_override != null ? [each.value.scale_unit.host_network.intent.adapter_property_override] : []
          content {
            jumbo_packet              = adapter_property_override.value.jumbo_packet
            network_direct            = adapter_property_override.value.network_direct
            network_direct_technology = adapter_property_override.value.network_direct_technology
          }
        }
        adapter_property_override_enabled = each.value.scale_unit.host_network.intent.adapter_property_override_enabled
        name                              = each.value.scale_unit.host_network.intent.name
        dynamic "qos_policy_override" {
          for_each = each.value.scale_unit.host_network.intent.qos_policy_override != null ? [each.value.scale_unit.host_network.intent.qos_policy_override] : []
          content {
            bandwidth_percentage_smb          = qos_policy_override.value.bandwidth_percentage_smb
            priority_value8021_action_cluster = qos_policy_override.value.priority_value8021_action_cluster
            priority_value8021_action_smb     = qos_policy_override.value.priority_value8021_action_smb
          }
        }
        qos_policy_override_enabled = each.value.scale_unit.host_network.intent.qos_policy_override_enabled
        traffic_type                = each.value.scale_unit.host_network.intent.traffic_type
        dynamic "virtual_switch_configuration_override" {
          for_each = each.value.scale_unit.host_network.intent.virtual_switch_configuration_override != null ? [each.value.scale_unit.host_network.intent.virtual_switch_configuration_override] : []
          content {
            enable_iov               = virtual_switch_configuration_override.value.enable_iov
            load_balancing_algorithm = virtual_switch_configuration_override.value.load_balancing_algorithm
          }
        }
        virtual_switch_configuration_override_enabled = each.value.scale_unit.host_network.intent.virtual_switch_configuration_override_enabled
      }
      storage_auto_ip_enabled                 = each.value.scale_unit.host_network.storage_auto_ip_enabled
      storage_connectivity_switchless_enabled = each.value.scale_unit.host_network.storage_connectivity_switchless_enabled
      storage_network {
        name                 = each.value.scale_unit.host_network.storage_network.name
        network_adapter_name = each.value.scale_unit.host_network.storage_network.network_adapter_name
        vlan_id              = each.value.scale_unit.host_network.storage_network.vlan_id
      }
    }
    hvci_protection_enabled = each.value.scale_unit.hvci_protection_enabled
    infrastructure_network {
      dhcp_enabled = each.value.scale_unit.infrastructure_network.dhcp_enabled
      dns_server   = each.value.scale_unit.infrastructure_network.dns_server
      gateway      = each.value.scale_unit.infrastructure_network.gateway
      ip_pool {
        ending_address   = each.value.scale_unit.infrastructure_network.ip_pool.ending_address
        starting_address = each.value.scale_unit.infrastructure_network.ip_pool.starting_address
      }
      subnet_mask = each.value.scale_unit.infrastructure_network.subnet_mask
    }
    name_prefix = each.value.scale_unit.name_prefix
    optional_service {
      custom_location = each.value.scale_unit.optional_service.custom_location
    }
    physical_node {
      ipv4_address = each.value.scale_unit.physical_node.ipv4_address
      name         = each.value.scale_unit.physical_node.name
    }
    secrets_location                = each.value.scale_unit.secrets_location
    side_channel_mitigation_enabled = each.value.scale_unit.side_channel_mitigation_enabled
    smb_cluster_encryption_enabled  = each.value.scale_unit.smb_cluster_encryption_enabled
    smb_signing_enabled             = each.value.scale_unit.smb_signing_enabled
    storage {
      configuration_mode = each.value.scale_unit.storage.configuration_mode
    }
    streaming_data_client_enabled = each.value.scale_unit.streaming_data_client_enabled
    wdac_enabled                  = each.value.scale_unit.wdac_enabled
  }
}

