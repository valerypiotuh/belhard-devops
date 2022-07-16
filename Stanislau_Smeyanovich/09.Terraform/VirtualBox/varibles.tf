variable "vm_number" {
  type    = number
  default = "3"

}
variable "name" {
  type    = string
  default = "VMachine-%02d"

}
variable "image" {
  type    = string
  default = "https://app.vagrantup.com/ubuntu/boxes/bionic64/versions/20180903.0.0/providers/virtualbox.box"

}
variable "cpu_number" {
  type    = number
  default = "2"

}
variable "ram" {
  type    = number
  default = "512"

}  
variable "type" {
  type    = string
  default = "hostonly"

}
variable "interface" {
  type    = string
  default = "vboxnet1"
}
