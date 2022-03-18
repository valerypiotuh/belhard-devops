resource "docker_image" "nginx1" {
  name         = var.name
  keep_locally = var.keep_loc
   build {
    path = var.path
    dockerfile = var.docfile1
    tag = ["nginx1:one"]
 }
}
