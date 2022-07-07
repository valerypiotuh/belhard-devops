variable "quant" {
	default = "3"
}

variable "name" {
	default = "VM-%02d"
}

variable "image" {
	default = "https://app.vagrantup.com/ubuntu/boxes/bionic64/versions/20180903.0.0/providers/virtualbox.box"
}

variable "cpus" {
	default = "2"
}

variable "memory" {
	default = "1024 mib"
}

variable "type" {
	default = "hostonly"
}

variable "host_interface" {
	default = "vboxnet1"
}
