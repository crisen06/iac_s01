output "policy_name" {
  value = aws_iam_role_policy.test_policy.name
}

output "role_name" {
  value = aws_iam_role.test_role.name
}

