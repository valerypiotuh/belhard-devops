variable "nodes_count" {
  description = "The number of required nodes."
  type        = string
  default     = "1"
}

variable "cpus" {
  description = "The number of allocated CPU cores for one node."
  type        = string
  default     = "1"
}

variable "memory" {
  description = "The amount of allocated RAM for one node."
  type        = string
  default     = "1024 mib"
}
