variable "target_node" {
    description = "server for deploy" 
    default = "god"
}

variable "vm_to_clone" {
    description = "VM for clone"
    default = "ubuntu-bionic-18.04-cloudimg-20220310"
}

variable "server_uri" {
    description = "server uri for deploy"
    default = "https://10.13.133.7:8006/api2/json"
}

variable "server_user" {
    description = "user for server"
    default = "root@pam"
}

variable "server_pass" {
    description = "password for server"
    default = "22122009"
}

variable "vm_memory" {
    description = "memory for VM"
    default = "2048"
}

variable "vm_cpu" {
    description = "cpu for VM"
    default = "2"
}
