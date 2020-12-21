# prepare random password
resource "random_password" "password" {
  count            = var.generate_secret && var.enabled ? 1 : 0
  length           = 16
  special          = false
  override_special = "_%@"
  # won't change until kms-key-arn won't change
  keepers = {
    key_arn = var.kms_encrypt && ! var.external_kms_enabled ? module.kms_key.key_arn : var.kms_key
  }
}

locals {
  path  = var.labeled_path ? "${var.namespace}/${var.stage}/${var.name}" : var.path
  name  = "/${local.path}/${var.var_name}"
  value = var.generate_secret ? join("", random_password.password.*.result) : var.value
}

# Module creates KMS key and generates random password, encrypted and stored in SSM Parameter Store.

module "kms_key" {
  source                  = "git::https://github.com/cloudposse/terraform-aws-kms-key.git?ref=tags/0.8.0"
  enabled                 = var.kms_encrypt && ! var.external_kms_enabled ? true : false
  namespace               = var.namespace
  stage                   = var.stage
  name                    = var.name
  description             = "KMS key for parameter: ${local.name}"
  deletion_window_in_days = 10
  enable_key_rotation     = true
  alias                   = "alias/${local.path}"
  tags                    = var.tags
  attributes              = var.attributes
}

# store encrypted password in ssm
resource "aws_ssm_parameter" "parameter" {
  count       = var.enabled ? 1 : 0
  name        = local.name
  description = var.description
  type        = var.parameter_type
  value       = local.value
  key_id      = var.kms_encrypt ? var.external_kms_enabled && var.kms_key != "" ? var.kms_key : module.kms_key.key_id : null
  tags        = var.tags
}
