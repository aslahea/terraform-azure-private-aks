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

  private_cluster_enabled = var.private_cluster_enabled
  enable_auto_scaling     = var.enable_auto_scaling
  minimum_nodes           = var.minimum_nodes
  maximum_nodes           = var.maximum_nodes
  private_dns_zone_id     = var.private_dns_zone_id
  user_assigned_identity_id = var.user_assigned_identity_id
  tenant_id              = var.tenant_id
  azure_rbac_enabled     = var.azure_rbac_enabled
  admin_group_object_ids = var.admin_group_object_ids
}