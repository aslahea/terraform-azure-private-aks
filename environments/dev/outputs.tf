# Resource Group Outputs
output "resource_group_name" {
  value       = module.resource_group.resource_group_name
  description = "The name of the provisioned Resource Group."
}

output "resource_group_id" {
  value       = module.resource_group.resource_group_id
  description = "The ID of the provisioned Resource Group."
}

# Networking Outputs
output "vnet_id" {
  value       = module.vnet.vnet_id
  description = "The ID of the Virtual Network."
}

output "vnet_name" {
  value       = module.vnet.vnet_name
  description = "The name of the Virtual Network."
}

output "aks_subnet_id" {
  value       = module.vnet.aks_subnet_id
  description = "The ID of the AKS Subnet."
}

output "vm_subnet_id" {
  value       = module.vnet.vm_subnet_id
  description = "The ID of the validation VM Subnet."
}

# ACR Outputs
output "acr_id" {
  value       = module.acr.acr_id
  description = "The ID of the Azure Container Registry."
}

output "acr_login_server" {
  value       = module.acr.acr_login_server
  description = "The login server URL of the Azure Container Registry."
}
