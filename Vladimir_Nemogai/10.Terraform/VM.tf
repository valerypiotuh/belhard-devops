
resource "virtualbox_vm" "node" {
  count     = "${var.count}"
  name      = "${var.format}"
  image     = "${var.image}"
  cpus      = "${var.cpus}"
  memory    = "${var.memory}"

  network_adapter {
    type           = "${var.type}"
    host_interface = "${var.hosr_interface}"
  }
}

