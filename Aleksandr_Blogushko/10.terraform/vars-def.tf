variable "speedtest_image" {
  type    = string
}
variable "speedtest_container_name" {
  type    = string
}
variable "speedtest_host-path" {
  type    = string
}

variable "nginx_image" {
  type    = string
}
variable "nginx_container_name" {
  type    = string
}
variable "nginx_ports_external" {
  type    = number
}

variable "postgres_image" {
  type    = string
}
variable "postgres_container_name" {
  type    = string
}
variable "postgres_volumes_host-path" {
  type    = string
}

variable "pgadmin4_image" {
  type    = string
}
variable "pgadmin4_container_name" {
  type    = string
}
variable "pgadmin4_ports_external" {
  type    = number
}