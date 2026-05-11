output "policy_name" {
  value = aws_iam_role_policy.test_policy.name
}

output "role_name" {
  value = azurerm_storage_account.sa_utec.primary_blob_endpoint
}

