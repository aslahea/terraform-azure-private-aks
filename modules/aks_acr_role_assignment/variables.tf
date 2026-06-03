variable "aks_kubelet_identity_object_id" {
  type        = string
  description = "The Object ID of the AKS Kubelet Managed Identity."
}

variable "acr_id" {
  type        = string
  description = "The Resource ID of the Azure Container Registry."
}
