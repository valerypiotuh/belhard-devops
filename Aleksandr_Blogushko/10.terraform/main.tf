provider "docker" {}

resource "docker_image" "speedtest" {
  name         = var.speedtest_image
  keep_locally = true
}
resource "docker_container" "speedtest" {
  image = docker_image.speedtest.latest
  name  = var.speedtest_container_name
  rm = true
  volumes {
    host_path      = var.speedtest_host-path
    container_path = "/app"
  }
}

resource "docker_image" "nginx" {
  name         = var.nginx_image
  keep_locally = true
}
resource "docker_container" "web-nginx" {
  image = docker_image.nginx.latest
  name  = var.nginx_container_name
  upload {
    content = file("${path.module}/nginx-files/index.html")
    file    = "/nginx-files/index.html"
  }
  ports {
    internal = 80
    external = var.nginx_ports_external
  }
}

resource "docker_image" "pg-db" {
  name         = var.postgres_image
  keep_locally = true
}
resource "docker_container" "pg-db" {
  image = docker_image.pg-db.latest
  name  = var.postgres_container_name
  env = [
    "POSTGRES_HOST_AUTH_METHOD=trust"
  ]
  volumes {
    host_path      = var.postgres_volumes_host-path
    container_path = "/dump"
  }
}

resource "docker_image" "pgadmin4" {
  name         = var.pgadmin4_image
  keep_locally = true
}
resource "docker_container" "pgadmin4" {
  image = docker_image.pgadmin4.latest
  name  = var.pgadmin4_container_name
  env = [
    "PGADMIN_DEFAULT_EMAIL=admin@admin.co",
    "PGADMIN_DEFAULT_PASSWORD=root"
  ]
  ports {
    internal = 80
    external = var.pgadmin4_ports_external
  }
}