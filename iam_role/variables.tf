variable "role_name" {
  description = "The name of the IAM role"
  type        = string
}

variable "assume_role_policy" {
  description = "The assume role policy document"
  type        = string
}

variable "attached_policies" {
  description = "List of ARNs of policies to attach to the role"
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "Tags for the IAM role"
  type        = map(string)
  default     = {}
}
