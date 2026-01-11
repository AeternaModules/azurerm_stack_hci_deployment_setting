variable "stack_hci_deployment_settings" {
  description = <<EOT
Map of stack_hci_deployment_settings, attributes below
Required:
    - arc_resource_ids
    - stack_hci_cluster_id
    - version
    - scale_unit (block):
        - active_directory_organizational_unit_path (required)
        - bitlocker_boot_volume_enabled (optional)
        - bitlocker_data_volume_enabled (optional)
        - cluster (required, block):
            - azure_service_endpoint (required)
            - cloud_account_name (required)
            - name (required)
            - witness_path (required)
            - witness_type (required)
        - credential_guard_enabled (optional)
        - domain_fqdn (required)
        - drift_control_enabled (optional)
        - drtm_protection_enabled (optional)
        - episodic_data_upload_enabled (optional)
        - eu_location_enabled (optional)
        - host_network (required, block):
            - intent (required, block):
                - adapter (required)
                - adapter_property_override (optional, block):
                    - jumbo_packet (optional)
                    - network_direct (optional)
                    - network_direct_technology (optional)
                - adapter_property_override_enabled (optional)
                - name (required)
                - qos_policy_override (optional, block):
                    - bandwidth_percentage_smb (optional)
                    - priority_value8021_action_cluster (optional)
                    - priority_value8021_action_smb (optional)
                - qos_policy_override_enabled (optional)
                - traffic_type (required)
                - virtual_switch_configuration_override (optional, block):
                    - enable_iov (optional)
                    - load_balancing_algorithm (optional)
                - virtual_switch_configuration_override_enabled (optional)
            - storage_auto_ip_enabled (optional)
            - storage_connectivity_switchless_enabled (optional)
            - storage_network (required, block):
                - name (required)
                - network_adapter_name (required)
                - vlan_id (required)
        - hvci_protection_enabled (optional)
        - infrastructure_network (required, block):
            - dhcp_enabled (optional)
            - dns_server (required)
            - gateway (required)
            - ip_pool (required, block):
                - ending_address (required)
                - starting_address (required)
            - subnet_mask (required)
        - name_prefix (required)
        - optional_service (required, block):
            - custom_location (required)
        - physical_node (required, block):
            - ipv4_address (required)
            - name (required)
        - secrets_location (required)
        - side_channel_mitigation_enabled (optional)
        - smb_cluster_encryption_enabled (optional)
        - smb_signing_enabled (optional)
        - storage (required, block):
            - configuration_mode (required)
        - streaming_data_client_enabled (optional)
        - wdac_enabled (optional)
EOT

  type = map(object({
    arc_resource_ids     = list(string)
    stack_hci_cluster_id = string
    version              = string
    scale_unit = object({
      active_directory_organizational_unit_path = string
      bitlocker_boot_volume_enabled             = optional(bool, true)
      bitlocker_data_volume_enabled             = optional(bool, true)
      cluster = object({
        azure_service_endpoint = string
        cloud_account_name     = string
        name                   = string
        witness_path           = string
        witness_type           = string
      })
      credential_guard_enabled     = optional(bool, false)
      domain_fqdn                  = string
      drift_control_enabled        = optional(bool, true)
      drtm_protection_enabled      = optional(bool, true)
      episodic_data_upload_enabled = optional(bool, true)
      eu_location_enabled          = optional(bool, false)
      host_network = object({
        intent = object({
          adapter = list(string)
          adapter_property_override = optional(object({
            jumbo_packet              = optional(string)
            network_direct            = optional(string)
            network_direct_technology = optional(string)
          }))
          adapter_property_override_enabled = optional(bool, false)
          name                              = string
          qos_policy_override = optional(object({
            bandwidth_percentage_smb          = optional(string)
            priority_value8021_action_cluster = optional(string)
            priority_value8021_action_smb     = optional(string)
          }))
          qos_policy_override_enabled = optional(bool, false)
          traffic_type                = list(string)
          virtual_switch_configuration_override = optional(object({
            enable_iov               = optional(string)
            load_balancing_algorithm = optional(string)
          }))
          virtual_switch_configuration_override_enabled = optional(bool, false)
        })
        storage_auto_ip_enabled                 = optional(bool, true)
        storage_connectivity_switchless_enabled = optional(bool, false)
        storage_network = object({
          name                 = string
          network_adapter_name = string
          vlan_id              = string
        })
      })
      hvci_protection_enabled = optional(bool, true)
      infrastructure_network = object({
        dhcp_enabled = optional(bool, false)
        dns_server   = list(string)
        gateway      = string
        ip_pool = object({
          ending_address   = string
          starting_address = string
        })
        subnet_mask = string
      })
      name_prefix = string
      optional_service = object({
        custom_location = string
      })
      physical_node = object({
        ipv4_address = string
        name         = string
      })
      secrets_location                = string
      side_channel_mitigation_enabled = optional(bool, true)
      smb_cluster_encryption_enabled  = optional(bool, false)
      smb_signing_enabled             = optional(bool, true)
      storage = object({
        configuration_mode = string
      })
      streaming_data_client_enabled = optional(bool, true)
      wdac_enabled                  = optional(bool, true)
    })
  }))
}

