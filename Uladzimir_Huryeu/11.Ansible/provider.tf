resource "virtualbox_vm" "node" {
  count     = var.cnt
  name      = format("node-%02d", count.index + 1)
  image     = var.image
  cpus      = var.cpus
  memory    = var.memory

  network_adapter {
    type           = var.network_type
    host_interface = var.host_interface
  }
}