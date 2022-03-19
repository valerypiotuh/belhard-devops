resource "virtualbox_vm" "node" {
  count     = var.param_vm["cnt"]
  name      = format("node-%02d", count.index + 1)
  image     = var.param_vm["image"]
  cpus      = var.param_vm["cpus"]
  memory    = var.param_vm["memory"]

  network_adapter {
    type           = var.param_net["type"]
    host_interface = var.param_net["host_interface"]
  }
}
