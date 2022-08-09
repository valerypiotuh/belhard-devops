provider "docker" {}

resource "docker_image" "nginx" {
  name         = var.nginx_image
  keep_locally = false
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.latest
  name  = var.nginx_name
  volumes {
    host_path      = var.nginx_path
    container_path = "/usr/share/nginx/html"
    read_only      = true
  }
  ports {
    internal = 80
    external = var.nginx_external_port
  }

}
resource "docker_image" "postgres" {
  name         = var.postgres_image
  keep_locally = true
}

resource "docker_container" "postgres" {
  image = docker_image.postgres.latest
  name  = var.postgres_container_name
  env = [
    "POSTGRES_HOST_AUTH_METHOD=trust"
  ]
  volumes {
    host_path      = var.postgres_path
    container_path = "/dmp"
    read_only      = true
  }
}
resource "docker_image" "pgadmin" {
  name         = var.pgadmin_image
  keep_locally = true
}
resource "docker_container" "pgadmin4" {
  image = "docker_image.pgadmin.latest"
  name  = var.pgadmin_name

  env = [
    "PGADMIN_DEFAULT_EMAIL=admin@admin.co",
    "PGADMIN_DEFAULT_PASSWORD=root"
  ]


  ports {
    internal = 80
    external = var.pgadmin_external_port
  }
}
resource "docker_image" "speedtest" {
  name         = var.speedtest-image
  keep_locally = true
}
resource "docker_container" "speedtest" {
  image = docker_image.speedtest.latest
  name  = "speedtest"
  rm    = true
  volumes {
    host_path      = var.speedtest-cli-log
    container_path = "/app"
  }
}
