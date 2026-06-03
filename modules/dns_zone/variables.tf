variable "private_dns_zone_name" {
  type        = string
  description = "The name of the private DNS zone."
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group."
}

variable "vnet_id" {
  type        = string
  description = "The ID of the VNet."
}

variable "vnet_link_name" {
  type        = string
  description = "The name of the VNet link."
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to the private DNS zone."
}