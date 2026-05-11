output "policy_name" {
  value = test_policy
}

output "blob_endpoint" {
  value = azurerm_storage_account.sa_utec.primary_blob_endpoint
}

output "primary_access_key" {
  value     = azurerm_storage_account.sa_utec.primary_access_key
  sensitive = true
}
