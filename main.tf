# Module creates KMS key and generates random password, encrypted and stored in SSM Parameter Store.

module "kms_key" {
  source                  = "git::https://github.com/cloudposse/terraform-aws-kms-key.git?ref=tags/0.4.0"
  namespace               = var.namespace
  stage                   = var.stage
  name                    = var.name
  description             = "KMS key for RDS: ${var.namespace}-${var.stage}-${var.name}"
  deletion_window_in_days = 10
  enable_key_rotation     = true
  alias                   = "alias/${var.namespace}-${var.stage}-${var.name}-rds-key"
  tags                    = var.tags
}

# prepare random password
resource "random_password" "password" {
  length           = 16
  special          = false
  override_special = "_%@"
  # won't change until kms-key-arn won't change
  keepers = {
    key_arn = module.kms_key.key_arn
  }
}

# store encrypted password in ssm
resource "aws_ssm_parameter" "secret" {
  name        = "/${var.namespace}/${var.stage}/${var.name}/rds_password"
  description = "encrypted RDS master password"
  type        = "SecureString"
  value       = random_password.password.result
  key_id      = module.kms_key.key_id

  tags = var.tags
}
