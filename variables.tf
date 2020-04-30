variable "namespace" {
  type        = string
  description = "Namespace (e.g. `eg` or `cd`)"
}

variable "stage" {
  type        = string
  description = "Stage (e.g. `production`, `testing`, `staging`)"
}

variable "name" {
  type        = string
  description = "Name of the application"
  default     = "mx-tools"
}

variable "tags" {
  type        = map(string)
  description = "Additional tags (_e.g._ { BusinessUnit : ABC })"
}

variable "path" {
  type        = string
  description = "Path to parameter"
  default     = ""
}

variable "var_name" {
  type        = string
  description = "Name of parameter"
}

variable "kms_encrypt" {
  type        = bool
  description = "Should use KMS encryption"
  default     = false
}

variable "generate_secret" {
  type        = bool
  description = "Should generate random string and store in parameter store? Will ignore value input"
  default     = false
}

variable "value" {
  type        = string
  description = "Value to store in Parameter Store. Setting 'generate_secret' to true will cause ignoring this parameter"
  default     = ""
}

variable "description" {
  type        = string
  description = "Parameter's description"
  default     = ""
}

variable "parameter_type" {
  type        = string
  description = "Parameter type: String (default) or SecureString"
  default     = "String"
}

variable "enabled" {
  type        = bool
  description = "Enable/disable creating resources"
  default     = true
}

variable "labeled_path" {
  type        = bool
  description = "Defines whether create path following this pattern: /[namespace]/[stage]/[name], setting to true will ignore 'path' parameter"
  default     = false
}