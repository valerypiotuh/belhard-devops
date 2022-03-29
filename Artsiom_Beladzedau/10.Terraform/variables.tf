variable "cnt"   {
  description = "количество машин"
  type = number
  default = 3
}

variable "image"   {
  description = "образ для виртуалки"
  type = string
  default = "virtualbox.box"
}

variable "cpus"   {
  description = "количетво процессоров"
  type = number
  default = 2
}

variable "memory"   {
  description = "размер памяти"
  type = string
  default = "512 mib"
}

variable "type"   {
  description = "тип сетевого адаптера"
  type = string
  default = "hostonly"
} 

variable "host_interface"   {
  description = "имя сетевого адаптера"
  type = string
  default = "vboxnet1"
} 
