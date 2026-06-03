variable "aks_name" {
  type        = string
  description = "The name of the AKS."
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group."
}

variable "location" {
  type        = string
  description = "The location of the AKS."
}

variable "dns_prefix" {
  type        = string
  description = "The DNS prefix of the AKS."
}

variable "kubernetes_version" {
  type        = string
  description = "The Kubernetes version of the AKS."
}

variable "node_count" {
  type        = number
  description = "The number of nodes in the AKS."
}

variable "vm_size" {
  type        = string
  description = "The type of nodes in the AKS."
  default     = "Standard_D2s_v3"
}

variable "aks_subnet_id" {
  type        = string
  description = "The ID of the AKS subnet."
}

variable "private_cluster_enabled" {
  type        = bool
  description = "Whether the private cluster is enabled."
  default     = true
}

variable "enable_auto_scaling" {
  type        = bool
  description = "Whether the auto scaling is enabled."
  default     = true
}

variable "minimum_nodes" {
  type        = number
  description = "The minimum number of nodes in the AKS."
  default     = 1
}

variable "maximum_nodes" {
  type        = number
  description = "The maximum number of nodes in the AKS."
  default     = 3
}

variable "private_dns_zone_id" {
  type        = string
  description = "The ID of the custom Private DNS Zone to link with the private AKS cluster."
  default     = null # Set to null if you want Azure to auto-create the zone
}

variable "user_assigned_identity_id" {
  type        = string
  description = "The Resource ID of the User-Assigned Managed Identity for the AKS control plane."
}

variable "tenant_id" {
  type        = string
  description = "The Tenant ID for Microsoft Entra ID authentication. If not specified, the current provider tenant will be used."
  default     = null
}

variable "azure_rbac_enabled" {
  type        = bool
  description = "Whether to enable Azure RBAC for Kubernetes authorization."
  default     = true
}

variable "admin_group_object_ids" {
  type        = list(string)
  description = "A list of Object IDs of Microsoft Entra ID Groups that should have admin access to the cluster."
  default     = []
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to the AKS."
}