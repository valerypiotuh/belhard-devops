provider "docker" {}

resource "docker_image" "ownimage" {
  name         = var.ownimage_name
  keep_locally = false
}

resource "docker_container" "ownimage" {
  image = docker_image.ownimage.latest
  name = var.ownimage_contaiber_name
  volumes {
    host_path      = var.speedtest_path
    container_path = "/app"
  }
}

resource "docker_image" "nginx" {
  name         = var.nginx_image_name
  keep_locally = false
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.latest
  name = var.nginx_container_name
  upload {
    content = file("${path.module}/index.html")

    file = "/usr/share/nginx/html/index.html"
  }
  ports {
    internal = 80
    external = var.nginx_ex_port
  }
}

resource "docker_image" "postgres" {
  name         = var.postgres_image_name
  keep_locally = false
}

resource "docker_container" "postgres" {
  image = docker_image.postgres.latest
  name  = var.postgres_container_name
  env = [
    "POSTGRES_HOST_AUTH_METHOD=trust"
  ]
}

resource "docker_image" "pgadmin" {
  name         = var.pgadmin_image_name
  keep_locally = true
}
resource "docker_container" "pgadmin4" {
  image = docker_image.pgadmin.latest
  name  = var.pgadmin_container_name
  env = [
    "PGADMIN_DEFAULT_EMAIL=admin@admin.co",
    "PGADMIN_DEFAULT_PASSWORD=root"
  ]
  ports {
    internal = 80
    external = var.pgadmin_ex_port
  }
}
