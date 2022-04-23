resource "docker_image" "nginx" {
  name = "nginx:latest"
  keep_locally = false
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.latest
  name = "docker8100"
  ports {
    internal = 80
    external = 8100
  }
  upload {
    source = "/home/god/belhard-devops/Alex_Klimoff/10.Terraform/docker/1/index.html"
    file = "/usr/share/nginx/html/index.html"
  }
}

resource "docker_container" "nginx1" {
  image = docker_image.nginx.latest
  name = "docker8200"
  ports {
    internal = 80
    external = 8200
  }
  upload {
    source = "/home/god/belhard-devops/Alex_Klimoff/10.Terraform/docker/2/index.html"
    file = "/usr/share/nginx/html/index.html"
  }
}

