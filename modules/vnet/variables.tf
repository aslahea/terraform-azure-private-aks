variable "resource_group_name" {
  type        = string
  description = "The name of the resource group."
}

variable "location" {
  type        = string
  description = "The Azure region where the VNet will be created."
}

variable "vnet_name" {
  type        = string
  description = "The name of the Virtual Network."
}

variable "address_space" {
  type        = list(string)
  description = "The address space for the Virtual Network."
  default     = ["10.240.0.0/16"]
}

variable "aks_subnet_name" {
  type        = string
  description = "The name of the subnet for AKS."
  default     = "snet-aks"
}

variable "aks_subnet_prefix" {
  type        = list(string)
  description = "The address prefixes for the AKS subnet."
  default     = ["10.240.0.0/22"]
}

variable "validation_subnet_name" {
  type        = string
  description = "The name of the validation subnet."
  default     = "snet-validation"
}

variable "validation_subnet_prefix" {
  type        = list(string)
  description = "The address prefixes for the validation subnet."
  default     = ["10.240.4.0/24"]
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to resources."
  default     = {}
}
