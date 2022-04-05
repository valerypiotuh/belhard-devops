variable "cnt" {
  description = "numbers of virtual machines"
  default = 3
}
variable "image" {
  description = "source of image"
  default = "~/Terraform/bionic-server-cloudimg-amd64-vagrant.box"
}
variable "cpus" {
  description = "numbers of cpus"
  default = 2
}
variable "memory" {
  description = "memory"
  default = "512 mib"
}
variable "network_type" {
  description = "type of network_adapter"
  default = "hostonly"
}
variable "host_interface" {
  description = "host_interface"
  default = "vboxnet1"
}