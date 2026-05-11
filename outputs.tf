output "policy_name" {
  value = aws_iam_role_policy.test_policy.name
}

output "blob_endpoint" {
  value = azurerm_storage_account.sa_utec.primary_blob_endpoint
}

output "primary_access_key" {
  value     = azurerm_storage_account.sa_utec.primary_access_key
  sensitive = true
}
