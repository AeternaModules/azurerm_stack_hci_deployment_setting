resource "azurerm_stack_hci_deployment_setting" "stack_hci_deployment_settings" {
  for_each = var.stack_hci_deployment_settings

  arc_resource_ids     = each.value.arc_resource_ids
  stack_hci_cluster_id = each.value.stack_hci_cluster_id
  version              = each.value.version

  dynamic "scale_unit" {
    for_each = each.value.scale_unit
    content {
      active_directory_organizational_unit_path = scale_unit.value.active_directory_organizational_unit_path
      bitlocker_boot_volume_enabled             = scale_unit.value.bitlocker_boot_volume_enabled
      bitlocker_data_volume_enabled             = scale_unit.value.bitlocker_data_volume_enabled
      cluster {
        azure_service_endpoint = scale_unit.value.cluster.azure_service_endpoint
        cloud_account_name     = scale_unit.value.cluster.cloud_account_name
        name                   = scale_unit.value.cluster.name
        witness_path           = scale_unit.value.cluster.witness_path
        witness_type           = scale_unit.value.cluster.witness_type
      }
      credential_guard_enabled     = scale_unit.value.credential_guard_enabled
      domain_fqdn                  = scale_unit.value.domain_fqdn
      drift_control_enabled        = scale_unit.value.drift_control_enabled
      drtm_protection_enabled      = scale_unit.value.drtm_protection_enabled
      episodic_data_upload_enabled = scale_unit.value.episodic_data_upload_enabled
      eu_location_enabled          = scale_unit.value.eu_location_enabled
      host_network {
        dynamic "intent" {
          for_each = scale_unit.value.host_network.intent
          content {
            adapter = intent.value.adapter
            dynamic "adapter_property_override" {
              for_each = intent.value.adapter_property_override != null ? [intent.value.adapter_property_override] : []
              content {
                jumbo_packet              = adapter_property_override.value.jumbo_packet
                network_direct            = adapter_property_override.value.network_direct
                network_direct_technology = adapter_property_override.value.network_direct_technology
              }
            }
            adapter_property_override_enabled = intent.value.adapter_property_override_enabled
            name                              = intent.value.name
            dynamic "qos_policy_override" {
              for_each = intent.value.qos_policy_override != null ? [intent.value.qos_policy_override] : []
              content {
                bandwidth_percentage_smb          = qos_policy_override.value.bandwidth_percentage_smb
                priority_value8021_action_cluster = qos_policy_override.value.priority_value8021_action_cluster
                priority_value8021_action_smb     = qos_policy_override.value.priority_value8021_action_smb
              }
            }
            qos_policy_override_enabled = intent.value.qos_policy_override_enabled
            traffic_type                = intent.value.traffic_type
            dynamic "virtual_switch_configuration_override" {
              for_each = intent.value.virtual_switch_configuration_override != null ? [intent.value.virtual_switch_configuration_override] : []
              content {
                enable_iov               = virtual_switch_configuration_override.value.enable_iov
                load_balancing_algorithm = virtual_switch_configuration_override.value.load_balancing_algorithm
              }
            }
            virtual_switch_configuration_override_enabled = intent.value.virtual_switch_configuration_override_enabled
          }
        }
        storage_auto_ip_enabled                 = scale_unit.value.host_network.storage_auto_ip_enabled
        storage_connectivity_switchless_enabled = scale_unit.value.host_network.storage_connectivity_switchless_enabled
        dynamic "storage_network" {
          for_each = scale_unit.value.host_network.storage_network
          content {
            name                 = storage_network.value.name
            network_adapter_name = storage_network.value.network_adapter_name
            vlan_id              = storage_network.value.vlan_id
          }
        }
      }
      hvci_protection_enabled = scale_unit.value.hvci_protection_enabled
      dynamic "infrastructure_network" {
        for_each = scale_unit.value.infrastructure_network
        content {
          dhcp_enabled = infrastructure_network.value.dhcp_enabled
          dns_server   = infrastructure_network.value.dns_server
          gateway      = infrastructure_network.value.gateway
          dynamic "ip_pool" {
            for_each = infrastructure_network.value.ip_pool
            content {
              ending_address   = ip_pool.value.ending_address
              starting_address = ip_pool.value.starting_address
            }
          }
          subnet_mask = infrastructure_network.value.subnet_mask
        }
      }
      name_prefix = scale_unit.value.name_prefix
      optional_service {
        custom_location = scale_unit.value.optional_service.custom_location
      }
      dynamic "physical_node" {
        for_each = scale_unit.value.physical_node
        content {
          ipv4_address = physical_node.value.ipv4_address
          name         = physical_node.value.name
        }
      }
      secrets_location                = scale_unit.value.secrets_location
      side_channel_mitigation_enabled = scale_unit.value.side_channel_mitigation_enabled
      smb_cluster_encryption_enabled  = scale_unit.value.smb_cluster_encryption_enabled
      smb_signing_enabled             = scale_unit.value.smb_signing_enabled
      storage {
        configuration_mode = scale_unit.value.storage.configuration_mode
      }
      streaming_data_client_enabled = scale_unit.value.streaming_data_client_enabled
      wdac_enabled                  = scale_unit.value.wdac_enabled
    }
  }
}

