variable "acr_name" {
  type        = string
  description = "The name of the ACR."
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group."
}

variable "location" {
  type        = string
  description = "The location of the ACR."
}

variable "sku" {
  type        = string
  description = "The SKU of the ACR."
}

variable "admin_enabled" {
  type        = bool
  description = "Whether the admin user is enabled."
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to the ACR."
}