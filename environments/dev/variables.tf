variable "resource_group_name" {
  type        = string
  description = "The name of the resource group."
}

variable "location" {
  type        = string
  description = "The Azure region where resources will be created."
}

variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the resources."
}

# VNet variables
variable "vnet_name" {
  type        = string
  description = "The name of the Virtual Network."
}

variable "address_space" {
  type        = list(string)
  description = "The address space for the Virtual Network."
}

variable "aks_subnet_name" {
  type        = string
  description = "The name of the subnet for AKS."
}

variable "aks_subnet_prefix" {
  type        = list(string)
  description = "The address prefixes for the AKS subnet."
}

variable "vm_subnet_name" {
  type        = string
  description = "The name of the validation VM subnet."
}

variable "vm_subnet_prefix" {
  type        = list(string)
  description = "The address prefixes for the validation VM subnet."
}

# ACR variables
variable "acr_name" {
  type        = string
  description = "The name of the Azure Container Registry."
}

variable "acr_sku" {
  type        = string
  description = "The SKU of the Azure Container Registry."
}

variable "acr_admin_enabled" {
  type        = bool
  description = "Whether the admin user is enabled for the ACR."
}

# AKS variables
variable "aks_name" {
  type        = string
  description = "The name of the AKS cluster."
}

variable "dns_prefix" {
  type        = string
  description = "The DNS prefix of the AKS cluster."
}

variable "kubernetes_version" {
  type        = string
  description = "The Kubernetes version of the AKS cluster."
}

variable "node_count" {
  type        = number
  description = "The default number of nodes in the AKS cluster."
}

variable "vm_size" {
  type        = string
  description = "The type/size of nodes in the AKS cluster."
}

variable "private_cluster_enabled" {
  type        = bool
  description = "Whether the private cluster is enabled."
}

variable "enable_auto_scaling" {
  type        = bool
  description = "Whether autoscaling is enabled."
}

variable "minimum_nodes" {
  type        = number
  description = "The minimum number of nodes in the AKS cluster."
}

variable "maximum_nodes" {
  type        = number
  description = "The maximum number of nodes in the AKS cluster."
}

variable "private_dns_zone_id" {
  type        = string
  description = "The ID of the custom Private DNS Zone to link with the private AKS cluster."
}

variable "tenant_id" {
  type        = string
  description = "The Tenant ID for Microsoft Entra ID authentication."
}

variable "azure_rbac_enabled" {
  type        = bool
  description = "Whether to enable Azure RBAC for Kubernetes authorization."
}

variable "admin_group_object_ids" {
  type        = list(string)
  description = "A list of Object IDs of Microsoft Entra ID Groups that should have admin access to the cluster."
}

variable "aks_network_role_name" {
  type        = string
  description = "The role definition name to assign to the AKS control plane identity over the VNet."
}

variable "aks_acr_role_name" {
  type        = string
  description = "The role definition name to assign to the AKS Kubelet identity over the ACR."
}