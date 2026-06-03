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