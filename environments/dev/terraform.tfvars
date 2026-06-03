# Resource Group variables
resource_group_name = "week42-private-aks-rg"
location            = "centralindia"

tags = {
  environment = "dev"
  project     = "week42-private-aks"
  managed_by  = "terraform"
  owner       = "Aslah"
}

# VNet variables
vnet_name         = "week42-vnet"
address_space     = ["10.240.0.0/16"]
aks_subnet_name   = "snet-aks"
aks_subnet_prefix = ["10.240.0.0/22"]
vm_subnet_name    = "snet-validation"
vm_subnet_prefix  = ["10.240.4.0/24"]

# ACR variables
acr_name          = "acrweek42aslah"
acr_sku           = "Premium"
acr_admin_enabled = false

# AKS variables
aks_name                  = "week42-aks"
dns_prefix                = "week42aks"
kubernetes_version        = "1.30"
node_count                = 1
vm_size                   = "Standard_D2s_v3"
private_cluster_enabled   = true
enable_auto_scaling       = true
minimum_nodes             = 1
maximum_nodes             = 3
private_dns_zone_id       = null
tenant_id                 = null
azure_rbac_enabled        = true
admin_group_object_ids    = []
aks_network_role_name     = "Network Contributor"
aks_acr_role_name         = "AcrPull"