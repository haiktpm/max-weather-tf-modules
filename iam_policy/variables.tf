variable "policy_name" {
  description = "The name of the IAM policy"
  type        = string
}

variable "policy_description" {
  description = "The description of the IAM policy"
  type        = string
}

variable "policy_document" {
  description = "The JSON document that defines the policy"
  type        = string
}

variable "attached_roles" {
  description = "List of IAM roles to attach this policy to"
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "Tags for the IAM policy"
  type        = map(string)
  default     = {}
}
