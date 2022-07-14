variable "ownimage_name" {
  type    = string
  default = "stanislausmain/speedtest:latest"

}
variable "ownimage_contaiber_name" {
  type    = string
  default = "ownimage"

}
variable "speedtest_path" {
  type    = string
  default = "/home/user/09.Terraform/hw/log"

}
variable "nginx_image_name" {
  type    = string
  default = "nginx:latest"

}
variable "nginx_container_name" {
  type    = string
  default = "nginx"

}
variable "nginx_ex_port" {
  type    = string
  default = "8800"

}
variable "postgres_image_name" {
  type    = string
  default = "postgres:latest"

}
variable "postgres_container_name" {
  type    = string
  default = "postgres"

}
variable "pgadmin_image_name" {
  type    = string
  default = "dpage/pgadmin4:latest"

}
variable "pgadmin_container_name" {
  type    = string
  default = "pgadmin"

}
variable "pgadmin_ex_port" {
  type    = string
  default = "8801"

}
