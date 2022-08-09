variable "nginx_name" {
  type    = string
  default = "nginx"

}
variable "nginx_path" {
  type    = string
  default = "/home/pivanaivy/nginx"
}
variable "nginx_image" {
  type    = string
  default = "nginx:latest"
}
variable "nginx_external_port" {
  type    = string
  default = "8100"
}
variable "postgres_path" {
  type    = string
  default = "/home/pivanaivy/08.Postgres/dmp"
}
variable "postgres_container_name" {
  type    = string
  default = "postgres"
}
variable "postgres_image" {
  type    = string
  default = "postgres:latest"
}
variable "speedtest-image" {
  type    = string
  default = "pivanaivy/homework:latest"
}
variable "speedtest-cli-log" {
  type    = string
  default = "/home/log"
}

variable "pgadmin_image" {
  type    = string
  default = "dpage/pgadmin4:latest"
}

variable "pgadmin_name" {
  type    = string
  default = "pgadmin"
}
variable "pgadmin_external_port" {
  type    = string
  default = "8001"
}
