/*output "rsd_master_password" {
  description = "RDS master password decrypted from KMS"
  value       = aws_ssm_parameter.secret.value
}*/


output "value" {
  description = "Stored value"
  value       = join("", aws_ssm_parameter.parameter.*.value)
}

output "ssm_arn" {
  value = aws_ssm_parameter.parameter.*.arn
}

# DEPRECATED:
output "kms_arn" {
  value = var.enabled && var.kms_encrypt ? [module.kms_key.key_arn] : []
  description = "DEPRECATED!"
}

output "kms_arn_single" {
  value = var.kms_encrypt ? module.kms_key.key_arn : ""
}

output "kms_key_id" {
  value = var.kms_encrypt ? module.kms_key.key_id : ""
}