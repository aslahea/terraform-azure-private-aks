module "resource_group" {
  source = "../../modules/resource_group"

  resource_group_name = var.resource_group_name
  location            = var.location
  tags                = var.tags
}

module "vnet" {
  source = "../../modules/vnet"

  resource_group_name = module.resource_group.resource_group_name
  location            = module.resource_group.location
  tags                = var.tags

  vnet_name         = var.vnet_name
  address_space     = var.address_space
  aks_subnet_name   = var.aks_subnet_name
  aks_subnet_prefix = var.aks_subnet_prefix
  vm_subnet_name    = var.vm_subnet_name
  vm_subnet_prefix  = var.vm_subnet_prefix
}

module "acr" {
  source = "../../modules/acr"

  acr_name            = var.acr_name
  resource_group_name = module.resource_group.resource_group_name
  location            = module.resource_group.location
  sku                 = var.acr_sku
  admin_enabled       = var.acr_admin_enabled
  tags                = var.tags
}

# 1. Private DNS Zone for Private Link
module "dns_zone" {
  source = "../../modules/dns_zone"

  private_dns_zone_name = var.private_dns_zone_name
  resource_group_name   = module.resource_group.resource_group_name
  vnet_id               = module.vnet.vnet_id
  vnet_link_name        = var.vnet_link_name
  tags                  = var.tags
}

# 2. User-Assigned Identity for the AKS Control Plane
resource "azurerm_user_assigned_identity" "aks_identity" {
  name                = "mi-${var.aks_name}-control-plane"
  resource_group_name = module.resource_group.resource_group_name
  location            = module.resource_group.location
  tags                = var.tags
}

# 3. Grant Network Contributor on the VNet to the Control Plane Identity
module "aks_network_contributor" {
  source = "../../modules/role_assignment"

  principal_id         = azurerm_user_assigned_identity.aks_identity.principal_id
  scope                = module.vnet.vnet_id
  role_definition_name = var.aks_network_role_name
}

# 4. Grant Private DNS Zone Contributor on the DNS Zone to the Control Plane Identity
module "aks_dns_contributor" {
  source = "../../modules/role_assignment"

  principal_id         = azurerm_user_assigned_identity.aks_identity.principal_id
  scope                = module.dns_zone.private_dns_zone_id
  role_definition_name = var.aks_dns_role_name
}

module "aks" {
  source = "../../modules/aks"

  aks_name            = var.aks_name
  resource_group_name = module.resource_group.resource_group_name
  location            = module.resource_group.location
  tags                = var.tags

  dns_prefix         = var.dns_prefix
  kubernetes_version = var.kubernetes_version
  node_count         = var.node_count
  vm_size            = var.vm_size
  aks_subnet_id      = module.vnet.aks_subnet_id

  private_cluster_enabled   = var.private_cluster_enabled
  enable_auto_scaling       = var.enable_auto_scaling
  minimum_nodes             = var.minimum_nodes
  maximum_nodes             = var.maximum_nodes
  private_dns_zone_id       = module.dns_zone.private_dns_zone_id
  user_assigned_identity_id = azurerm_user_assigned_identity.aks_identity.id
  tenant_id                 = var.tenant_id
  azure_rbac_enabled        = var.azure_rbac_enabled
  admin_group_object_ids    = var.admin_group_object_ids
}

# 5. Grant AcrPull on the ACR to the AKS Kubelet Identity
module "aks_acr_role_assignment" {
  source = "../../modules/role_assignment"

  principal_id         = module.aks.aks_kubelet_identity_object_id
  scope                = module.acr.acr_id
  role_definition_name = var.aks_acr_role_name
}

# 6. Validation VM for verifying Private Link connectivity
module "validation_vm" {
  source = "../../modules/validation_vm"

  vm_name             = var.validation_vm_name
  location            = module.resource_group.location
  resource_group_name = module.resource_group.resource_group_name
  subnet_id           = module.vnet.vm_subnet_id
  admin_username      = var.validation_vm_admin_username
  ssh_public_key      = var.validation_vm_ssh_public_key
  vm_size             = var.validation_vm_size
  public_ip_enabled   = var.validation_vm_public_ip_enabled
  tags                = var.tags
}