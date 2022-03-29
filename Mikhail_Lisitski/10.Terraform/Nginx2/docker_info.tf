
resource "docker_image" "nginx1" {
  name         = "nginx1"
  keep_locally = false
  build {
    path       = "."
    dockerfile = "nginx1/Dockerfile"
  }
}

resource "docker_container" "nginx1" {
  image = docker_image.nginx1.latest
  name  = "nginx1"
}

resource "docker_image" "nginx2" {
  name         = "nginx2"
  keep_locally = false
  build {
    path       = "."
    dockerfile = "nginx2/Dockerfile"
  }
}

resource "docker_container" "nginx2" {
  image = docker_image.nginx2.latest
  name  = "nginx2"
}


resource "docker_image" "nginx" {
  name         = "nginx"
  keep_locally = false
  build {
    path       = "."
    dockerfile = "nginx/Dockerfile"
  }
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.latest
  name  = "nginx"
  ports {
    external = 9100
    internal = 9100
  }
  ports {
    external = 9200
    internal = 9200
  }
}
