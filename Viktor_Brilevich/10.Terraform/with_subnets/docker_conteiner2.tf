resource "docker_container" "nginx2" {
   image = docker_image.nginx2.latest
   name  = var.name_con2
   network_mode = "bridge"
   networks_advanced  {
          name = "${docker_network.my_local_network2.name}"
          ipv4_address ="172.20.0.1"
    }
   hostname = "${var.customer_name}_{var.customer_subname2}"
   ports {
    internal = var.int_p
    external = var.ext_p_2
  }
}
