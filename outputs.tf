output "rsd_master_password" {
  description = "RDS master password decrypted from KMS"
  value       = aws_ssm_parameter.secret.value
}
