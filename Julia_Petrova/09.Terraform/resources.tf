resource "docker_image" "nginx" {
  name = "nginx:latest"
  keep_locally = false
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.latest
  name = "nginx"
  ports {
    internal = 80
    external = var.nginx_port
  }
}

resource "docker_image" "speedtest" {
  name = "juliaviolet666/speedtest:latest"
}

resource "docker_container" "speedtest" {
  name = "speedtest"
  image = docker_image.speedtest.latest

  volumes {
    host_path = "${abspath(path.module)}/logs"
    container_path = "/app"
  }
}

resource "docker_image" "postgres" {
  name = "postgres:latest"
  keep_locally = false
}

resource "docker_container" "postgres" {
  image = docker_image.postgres.latest
  name = "psql"
  env = [
    "POSTGRES_HOST_AUTH_METHOD=trust"
  ]
}

resource "docker_image" "pgadmin" {
  name = "dpage/pgadmin4:latest"
  keep_locally = true
}

resource "docker_container" "pgadmin4" {
  image = docker_image.pgadmin.latest
  name = "pgadmin"
  env = [
    "PGADMIN_DEFAULT_EMAIL=admin@admin.co",
    "PGADMIN_DEFAULT_PASSWORD=root"
  ]
  ports {
    internal = 80
    external = var.pgadmin_port
  }
}