output "private_dns_zone_id" {
  value       = azurerm_private_dns_zone.aks_private_dns_zone.id
  description = "The Resource ID of the Private DNS Zone."
}

output "private_dns_zone_name" {
  value       = azurerm_private_dns_zone.aks_private_dns_zone.name
  description = "The name of the Private DNS Zone."
}
