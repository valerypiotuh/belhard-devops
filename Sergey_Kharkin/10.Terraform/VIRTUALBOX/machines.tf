resource "virtualbox_vm" "node" {
  count  = var.number_of_vms
  name   = format("vm_vagrant-%02d", count.index + 1)
  image  = "https://app.vagrantup.com/ubuntu/boxes/bionic64/versions/20180903.0.0/providers/virtualbox.box"
  cpus   = var.cpus
  memory = var.ram

  network_adapter {
    type           = "hostonly"
    host_interface = "vboxnet1"
  }
}
