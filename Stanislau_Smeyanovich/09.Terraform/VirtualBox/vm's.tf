resource "virtualbox_vm" "node" {
  count     = var.vm_number
  name      = format(var.name, count.index + 1)
  image     = var.image
  cpus      = var.cpu_number
  memory    = var.ram

  network_adapter {
    type           = var.type
    host_interface = var.interface
  }
}