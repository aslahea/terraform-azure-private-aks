output "aks_cluster_name" {
  value       = azurerm_kubernetes_cluster.aks.name
  description = "The name of the AKS cluster."
}

output "aks_cluster_id" {
  value       = azurerm_kubernetes_cluster.aks.id
  description = "The Resource ID of the AKS cluster."
}

output "aks_kubelet_identity_object_id" {
  value       = azurerm_kubernetes_cluster.aks.kubelet_identity[0].object_id
  description = "The Object ID of the Kubelet Identity, used for role assignments (e.g. AcrPull)."
}

output "aks_control_plane_fqdn" {
  value       = azurerm_kubernetes_cluster.aks.private_fqdn
  description = "The private FQDN of the AKS API server."
}
