resource "azurerm_role_assignment" "aks_acr_pull" {
  scope                = var.acr_id
  role_definition_name = "AcrPull"
  principal_id         = var.aks_kubelet_identity_object_id

  # Avoid race conditions: wait for Azure AD to propagate identity
  skip_service_principal_aad_check = true
}
