data "azurerm_subnet" "k8s_subnet" {
  name                 = var.aks_subnet_name
  virtual_network_name = var.aks_vnet_name
  resource_group_name  = var.aks_vnet_rg
}

resource "azurerm_kubernetes_cluster" "k8s" {
    name                   = var.cluster_name
    location               = var.region
    resource_group_name    = var.resource_group
    kubernetes_version     = var.aks_version
    dns_prefix             = var.dns_prefix
    local_account_disabled = var.local_account_disabled
    sku_tier               = var.sku_tier

    linux_profile {
      admin_username = var.node_admin_username

      ssh_key {
          key_data = var.node_admin_ssh_pub_key
      }
    }

    addon_profile {
      kube_dashboard {
        enabled = var.kube_dashboard
      }
      azure_policy {
        enabled = var.azure_policy
      }
    }

    network_profile {
      network_plugin = "azure"
      network_policy = var.network_policy
    }

    default_node_pool {
      name               = "nodepool"
      node_count         = 3
      availability_zones = ["1", "2", "3"]
      vm_size            = var.cluster_node_vm_size
      enable_auto_scaling = true
      min_count           = 3
      max_count           = var.cluster_auto_scaling_max_nodes
      os_disk_size_gb     = var.cluster_node_vm_disk_size
      vnet_subnet_id      = data.azurerm_subnet.k8s_subnet.id
    }

    identity {
      type = "SystemAssigned"
    }

    maintenance_window {
      allowed {
        day   = var.maintenance_window_day
        hours = var.maintenance_window_time_frame
      }
    }

    role_based_access_control {
      enabled = true
      azure_active_directory {
        managed                = true
        admin_group_object_ids = var.aad_admin_group
      }
    }

    tags = {
      Environment = var.environment_tag
    }
}
