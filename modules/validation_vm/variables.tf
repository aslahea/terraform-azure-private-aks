variable "vm_name" {
  type        = string
  description = "The name of the VM."
}

variable "location" {
  type        = string
  description = "The location of the VM."
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group."
}

variable "subnet_id" {
  type        = string
  description = "The ID of the subnet."
}

variable "admin_username" {
  type        = string
  description = "The username of the admin user."
}

variable "ssh_public_key" {
  type        = string
  description = "The public key of the admin user."
}

variable "vm_size" {
  type        = string
  description = "The size of the VM."
}

variable "public_ip_enabled" {
  type        = bool
  description = "Whether the public IP is enabled."
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to the VM."
}