resource "docker_container" "nginx1" {
   image = docker_image.nginx1.latest
   name  = var.name_con1
   ports {
    internal = var.int_p
    external = var.ext_p_1
  }
}
