output "vnet_id" {
  value       = azurerm_virtual_network.vnet.id
  description = "The ID of the Virtual Network."
}

output "vnet_name" {
  value       = azurerm_virtual_network.vnet.name
  description = "The name of the Virtual Network."
}

output "aks_subnet_id" {
  value       = azurerm_subnet.aks.id
  description = "The ID of the AKS Subnet."
}

output "vm_subnet_id" {
  value       = azurerm_subnet.vm.id
  description = "The ID of the Validation VM Subnet."
}
