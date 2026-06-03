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
