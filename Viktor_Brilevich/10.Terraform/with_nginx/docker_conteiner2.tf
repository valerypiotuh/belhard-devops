resource "docker_container" "nginx2" {
   image = docker_image.nginx2.latest
   name  = var.name_con2
   ports {
    internal = var.int_p
    external = var.ext_p_2
  }
}

