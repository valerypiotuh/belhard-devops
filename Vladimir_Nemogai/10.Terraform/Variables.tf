variable count   {
  description = "Count VMs"
  default = 3
}

varible format   {
  description = "format VMs"
  default = "format("node-%02d", count.index + 1)"

variable image   {
  description = "Image VMs"
  default = "https://app.vagrantup.com/ubuntu/boxes/bionic64/versions/20180903.0.0/providers/virtualbox.box"
}

variable cpus   {
  description = "Cpus VM"
  default = 1
}

variable memory   {
  description = "Memory VMs"
  default = "512 mib"
}

variable type   {
  description = "Network VM"
  default = "hostonly"
}

variable host_interface   {
  description = "Name network VM"
  default = "vboxnet1"
}
