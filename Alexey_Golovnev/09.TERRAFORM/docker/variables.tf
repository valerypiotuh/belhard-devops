variable "nginx_port" {
  description = "External port for Nginx docker container."
  type        = string
  default     = "80"
}

variable "postgres_port" {
  description = "External port for PostgreSQL docker container."
  type        = string
  default     = "5432"
}

variable "pgadmin_port" {
  description = "External port for pgAdmin docker container."
  type        = string
  default     = "81"
}
