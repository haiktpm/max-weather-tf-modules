variable "route_table_id" {
  description = "The ID of the route table to associate"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs to associate with the route table"
  type        = list(string)
}
