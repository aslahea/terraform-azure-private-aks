output "vm_id" {
  value       = azurerm_linux_virtual_machine.vm.id
  description = "The Resource ID of the Virtual Machine."
}

output "vm_private_ip" {
  value       = azurerm_linux_virtual_machine.vm.private_ip_address
  description = "The private IP address of the Virtual Machine."
}

output "vm_public_ip" {
  value       = var.public_ip_enabled ? azurerm_public_ip.pip[0].ip_address : null
  description = "The public IP address of the Virtual Machine (if enabled)."
}
