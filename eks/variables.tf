variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs for the EKS cluster"
  type        = list(string)
}

variable "security_group_ids" {
  description = "List of security_group IDs for the EKS cluster"
  type        = list(string)
}

variable "nodegroup_subnet_ids" {
  description = "List of subnet IDs for the EKS cluster"
  type        = list(string)
}

variable "enable_public_access" {
  description = "Enable public access to the EKS cluster endpoint"
  type        = bool
  default     = true
}

variable "enable_private_access" {
  description = "Enable private access to the EKS cluster endpoint"
  type        = bool
  default     = false
}

variable "public_access_cidrs" {
  description = "CIDR blocks allowed to access the EKS cluster publicly"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "tags" {
  description = "Tags for the cluster resources"
  type        = map(string)
  default     = {}
}

variable "node_role_arn" {
  description = "IAM role ARN for the EKS node group"
  type        = string
}

variable "desired_capacity" {
  description = "Desired number of worker nodes"
  type        = number
}

variable "max_capacity" {
  description = "Maximum number of worker nodes"
  type        = number
}

variable "min_capacity" {
  description = "Minimum number of worker nodes"
  type        = number
}

variable "instance_types" {
  description = "List of instance types for the worker nodes"
  type        = list(string)
}

variable "eks_addons" {
  description = "List of EKS add-ons with optional configurations"
  type = list(object({
    name                     = string
    version                  = optional(string)
    resolve_conflicts        = optional(string, "OVERWRITE")
    service_account_role_arn = optional(string)
  }))
  default = [
    { name = "vpc-cni" },
    { name = "coredns" },
    { name = "kube-proxy" },
    { name =  "aws-ebs-csi-driver" }      
  ]
}
