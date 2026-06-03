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