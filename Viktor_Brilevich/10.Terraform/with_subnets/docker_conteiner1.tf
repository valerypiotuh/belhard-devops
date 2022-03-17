resource "docker_container" "nginx1" {
   image = docker_image.nginx1.latest
   name  = var.name_con1
   network_mode = "bridge"
   networks_advanced  {
          name = "${docker_network.my_local_network1.name}"
          ipv4_address ="172.19.0.1" 
    }
   hostname = "${var.customer_name}_{var.customer_subname1}"
   ports {
    internal = var.int_p
    external = var.ext_p_1
  }
}
