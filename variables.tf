
variable "name" {
  type        = string
  description = "Deployment name"
}

variable "values" {
  type        = list(string)
  default     = []
  description = "Paths to yaml files to add as values"
}

variable "set" {
  type        = map(string)
  default     = {}
  description = "Key value pair of additional values to add"
}

variable "set_sensitive" {
  type        = map(string)
  default     = {}
  description = "Key value pair of additional sensitive values to add. Wont be exposed in plan diffs"
}
