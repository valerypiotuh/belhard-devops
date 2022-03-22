variable "param_vm"   {
  description = "parameters of VMs"
  type = map(string)
  default = {
  cnt = "3"
  image = "bionic-server-cloudimg-amd64-vagrant.box"
  cpus = "2"
  memory = "512 mib"
}
}

variable "param_net"   {
  description = "parameters of network adapters"
  type = map(string)
  default = {
  type = "hostonly"
  host_interface = "vboxnet1"
}
}
