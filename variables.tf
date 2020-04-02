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
