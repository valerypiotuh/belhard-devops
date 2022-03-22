resource "docker_network" "my_local_network1" {
  name = "test_network1"
  ipam_config {
        gateway     = var.gateway1
        subnet      = var.subnet1
    }
}
