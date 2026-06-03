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

# AKS Outputs
output "aks_cluster_name" {
  value       = module.aks.aks_cluster_name
  description = "The name of the AKS cluster."
}

output "aks_cluster_id" {
  value       = module.aks.aks_cluster_id
  description = "The Resource ID of the AKS cluster."
}

output "aks_control_plane_fqdn" {
  value       = module.aks.aks_control_plane_fqdn
  description = "The private FQDN of the AKS API server."
}

# Role Assignment Outputs
output "aks_network_contributor_role_assignment_id" {
  value       = module.aks_network_contributor.role_assignment_id
  description = "The ID of the Network Contributor Role Assignment."
}

output "aks_acr_pull_role_assignment_id" {
  value       = module.aks_acr_role_assignment.role_assignment_id
  description = "The ID of the AcrPull Role Assignment."
}

# DNS Zone Outputs
output "private_dns_zone_id" {
  value       = module.dns_zone.private_dns_zone_id
  description = "The Resource ID of the Private DNS Zone."
}

output "private_dns_zone_name" {
  value       = module.dns_zone.private_dns_zone_name
  description = "The name of the Private DNS Zone."
}

output "aks_dns_contributor_role_assignment_id" {
  value       = module.aks_dns_contributor.role_assignment_id
  description = "The ID of the Private DNS Zone Contributor Role Assignment."
}
