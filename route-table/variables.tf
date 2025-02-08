variable "route_table_name" {
  description = "Name of the route table"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where the route table will be created"
  type        = string
}

variable "routes" {
  description = "List of routes to add to the route table"
  type = list(object({
    destination_cidr_block  = string
    gateway_id              = optional(string)
    nat_gateway_id          = optional(string)
    network_interface_id    = optional(string)
    transit_gateway_id      = optional(string)
    vpc_peering_connection_id = optional(string)
  }))
  default = []
}

variable "subnet_ids" {
  description = "List of subnet IDs to associate with the route table"
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "Tags to apply to the route table"
  type        = map(string)
  default     = {}
}
