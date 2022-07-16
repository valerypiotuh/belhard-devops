variable "speedtest_image" {
  type    = string
  default = "stopgamezz/speedtest:latest"
}

variable "speedtest_container_name" {
  type    = string
  default = "speedtest"
}

variable "speedtest_host-path" {
  type    = string
  default = "/home/user/10.terraform/log"
}

variable "nginx_image" {
  type    = string
  default = "nginx:1.22-alpine"
}

variable "nginx_container_name" {
  type    = string
  default = "web"
}

variable "nginx_ports_external" {
  type    = number
  default = 8000
}

variable "postgres_image" {
  type    = string
  default = "postgres:latest"
}

variable "postgres_container_name" {
  type    = string
  default = "postgredb"
}

variable "postgres_volumes_host-path" {
  type    = string
  default = "/home/user/10.terraform/postgredb_dump"
}

variable "pgadmin4_image" {
  type    = string
  default = "dpage/pgadmin4:latest"
}

variable "pgadmin4_container_name" {
  type    = string
  default = "pgadmin"
}

variable "pgadmin4_ports_external" {
  type    = number
  default = 8001
}