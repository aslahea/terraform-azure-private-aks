data "azurerm_client_config" "current" {}

resource "azurerm_kubernetes_cluster" "aks" {
  name                    = var.aks_name
  resource_group_name     = var.resource_group_name
  location                = var.location
  dns_prefix              = var.dns_prefix
  kubernetes_version      = var.kubernetes_version
  private_cluster_enabled = var.private_cluster_enabled
  private_dns_zone_id     = var.private_dns_zone_id

  default_node_pool {
    name                 = "default"
    vm_size              = var.vm_size
    vnet_subnet_id       = var.aks_subnet_id
    auto_scaling_enabled = var.enable_auto_scaling
    min_count            = var.enable_auto_scaling ? var.minimum_nodes : null
    max_count            = var.enable_auto_scaling ? var.maximum_nodes : null
    node_count           = var.enable_auto_scaling ? null : var.node_count
    type                 = "VirtualMachineScaleSets"
  }

  identity {
    type         = "UserAssigned"
    identity_ids = [var.user_assigned_identity_id]
  }

  network_profile {
    network_plugin    = "azure"
    load_balancer_sku = "standard"
  }

  azure_active_directory_role_based_access_control {
    tenant_id              = var.tenant_id != null ? var.tenant_id : data.azurerm_client_config.current.tenant_id
    azure_rbac_enabled     = var.azure_rbac_enabled
    admin_group_object_ids = var.admin_group_object_ids
  }

  tags = var.tags
}
