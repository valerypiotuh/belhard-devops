resource "virtualbox_vm" "node" {
  count  = var.count_vm
  name   = format("node-%02d", count.index + 1)
  image  = "vagrant.box"
  cpus   = var.cpus
  memory = var.memory

  network_adapter {
    type           = "hostonly"
    host_interface = "vboxnet1"
  }
}
