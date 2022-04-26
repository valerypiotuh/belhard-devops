terraform {
  required_providers {
    virtualbox = {
      source = "terra-farm/virtualbox"
      version = "0.2.2-alpha.1"
    }
  }
}


resource "virtualbox_vm" "node" {
  count     = 1
  name      = format("master-vm")
  image     = "/home/dimas/terraform/bionic-server-cloudimg-amd64-vagrant.box"
  cpus      = 2
  memory    = "512 mib"

  network_adapter {
    type           = "nat"
    host_interface = "vboxnet1"
  }
}

resource "virtualbox_vm" "node" {
  count     = 1
  name      = format("slave-node")
  image     = "/home/dimas/terraform/bionic-server-cloudimg-amd64-vagrant.box"
  cpus      = 2
  memory    = "2048 mib"

  network_adapter {
    type           = "nat"
    host_interface = "vboxnet1"
  }
}
