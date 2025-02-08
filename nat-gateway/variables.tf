variable "subnet_id" {
  description = "The public subnet ID where the NAT Gateway will be created"
  type        = string
}

variable "nat_gateway_name" {
  description = "The name tag for the NAT Gateway"
  type        = string
}

variable "tags" {
  description = "Tags to apply to the NAT Gateway"
  type        = map(string)
  default     = {}
}
