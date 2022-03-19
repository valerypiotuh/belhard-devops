resource "docker_image" "nginx2" {
  name         = var.name
  keep_locally = var.keep_loc
   build {
    path = var.path
    dockerfile = var.docfile2
 }
}
