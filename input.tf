variable "name" {
  type = string
}

variable "eks_version" {
  description = "with null value the latest vaersion is used."
  type        = string
  default     = null
}

# Amazon EKS creates cross-account elastic network interfaces in these subnets to allow communication between your worker nodes and the Kubernetes control plane.
variable "subnet_ids" {
  type = list(string)
  validation {
    condition     = length(var.subnet_ids) >= 2
    error_message = "List of subnet IDs. Must be in at least two different availability zones."
  }
}

variable "additional_tags" {
  default = {}
  type    = map(string)
}

variable "endpoint_public_access" {
  type    = bool
  default = true
}

variable "endpoint_private_access" {
  type    = bool
  default = false
}
