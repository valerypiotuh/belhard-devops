resource "virtualbox_vm" "node" {
  count     = var.quant
  name      = format(var.name, count.index + 1)
  image     = var.image
  cpus      = var.cpus
  memory    = var.memory

  network_adapter {
    type           = var.type
    host_interface = var.host_interface
  }
  }
