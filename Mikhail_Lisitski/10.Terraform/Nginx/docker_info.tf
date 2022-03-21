
resource "docker_image" "nginx1" {
  name         = "nginx:latest"
  keep_locally = false
  build {
    path       = "."
    dockerfile = "nginx1/Dockerfile"
  }
}

resource "docker_image" "nginx2" {
  name         = "nginx:latest"
  keep_locally = false
  build {
    path       = "."
    dockerfile = "nginx2/Dockerfile"
  }
}

resource "docker_container" "nginx1" {
  image = docker_image.nginx1.latest
  name  = "nginx1"
  ports {
    external = 9100
    internal = var.port_internal
  }
}

resource "docker_container" "nginx2" {
  image = docker_image.nginx2.latest
  name  = "nginx2"
  ports {
    external = 9200
    internal = var.port_internal
  }
}
