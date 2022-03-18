variable "cnt"   {
  description = "count VMs"
  type = number
  default = 3
}

variable "image"   {
  description = "Image of VM"
  type = string
  default = "bionic-server-cloudimg-amd64-vagrant.box"
}

variable "cpus"   {
  description = "Count of cpus for VM"
  type = number
  default = 2
}

variable "memory"   {
  description = "Size of memory for VM"
  type = string
  default = "512 mib"
}

variable "type"   {
  description = "Type of network adapter for VM"
  type = string
  default = "hostonly"
} 

variable "host_interface"   {
  description = "Name of network adapter interface for VM"
  type = string
  default = "vboxnet1"
} 
