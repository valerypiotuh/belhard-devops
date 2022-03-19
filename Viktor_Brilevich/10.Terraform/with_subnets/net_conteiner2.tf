resource "docker_network" "my_local_network2" {
  name = "test_network2"
  ipam_config {
        gateway     = var.gateway2
        subnet      = var.subnet2
    }
}
