variable "principal_id" {
  type        = string
  description = "The Object ID of the Security Principal (User, Group, or Managed Identity) to assign the role to."
}

variable "scope" {
  type        = string
  description = "The scope at which the Role Assignment applies (e.g., Resource Group ID, VNet ID, ACR ID)."
}

variable "role_definition_name" {
  type        = string
  description = "The name of the Azure Role Definition to assign (e.g., Reader, Network Contributor, AcrPull)."
}
