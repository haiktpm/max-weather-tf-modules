variable "vpc_id" {
  description = "The ID of the VPC where the Internet Gateway will be created"
  type        = string
}

variable "igw_name" {
  description = "The name tag for the Internet Gateway"
  type        = string
}

variable "tags" {
  description = "Tags to apply to the Internet Gateway"
  type        = map(string)
  default     = {}
}
