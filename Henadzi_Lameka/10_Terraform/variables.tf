variable "cnt"   {
  description = "amount_of_masHines"
  type = number
  default = 3
}

variable "image"   {
  description = "image_for_virt"
  type = string
  default = "virtualbox.box"
}

variable "cpus"   {
  description = "amount_CPU"
  type = number
  default = 2
}

variable "memory"   {
  description = "RAM"
  type = string
  default = "512 mib"
}

variable "type"   {
  description = "Name_of_Netwoork"
  type = string
  default = "hostonly"
} 

variable "host_interface"   {
  description = "Name_Of_Netw"
  type = string
  default = "vboxnet1"
} 
