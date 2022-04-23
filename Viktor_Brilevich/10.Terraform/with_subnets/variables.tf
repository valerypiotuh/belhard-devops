variable "customer_name"   {
  description = "first_name of docker mashine"
  type = string
  default = "vbril"
}

variable "customer_subname1"   {
  description = "second_name of docker mashine"
  type = string
  default = "docker_nginx1"
}

variable "customer_subname2"   {
  description = "second_name of docker mashine"
  type = string
  default = "docker_nginx2"
}

variable "name"   {
  description = "name of image from"
  type = string
  default = "nginx:latest"
}

variable "keep_loc"   {
  type = string
  default = "false"
}

variable "path"   {
  description = "path docker_image build"
  type = string
  default = "."
}

variable "docfile1"   {
  description = "path to Dockerfile"
  type = string
  default = "1/Dockerfile"
}

variable "docfile2"   {
  description = "path to Dockerfile"
  type = string
  default = "2/Dockerfile"
}

variable "name_im_1"   {
  description = "name image 1"
  type = string
  default = "docker_image.nginx1.latest"
}

variable "name_im_2"   {
  description = "name image 2"
  type = string
  default = "docker_image.nginx2.latest"
}

variable "name_con1"   {
  description = "conteiner name 1"
  type = string
  default = "tutorial1"
}

variable "name_con2"   {
  description = "conteiner name 2"
  type = string
  default = "tutorial2"
}

variable "int_p"   {
  description = "internal port"
  type = number
  default = 80
}

variable "ext_p_1"   {
  description = "external port in conteiner 1"
  type = number
  default = 8001
}

variable "ext_p_2"   {
  description = "external port in conteiner 2"
  type = number
  default = 8002
}

variable "gateway1"   {
  description = "gateway 1"
  type = string
  default = "172.19.0.254"
}

variable "gateway2"   {
  description = "gateway 2"
  type = string
  default = "172.20.0.254"
}

variable "subnet1"   {
  description = "subnet 1"
  type = string
  default = "172.19.0.0/24"
}

variable "subnet2"   {
  description = "subnet 2"
  type = string
  default = "172.20.0.0/24"
}
