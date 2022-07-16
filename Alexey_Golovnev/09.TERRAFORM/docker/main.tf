### Nginx

resource "docker_image" "nginx" {
  name = "nginx:latest"
}

resource "docker_container" "nginx" {
  name  = "nginx"
  image = docker_image.nginx.latest

  volumes {
    host_path      = "${abspath(path.module)}/nginx"
    container_path = "/usr/share/nginx"
    read_only      = true
  }

  ports {
    internal = 80
    external = var.nginx_port
  }
}

### PostgreSQL

resource "docker_image" "postgres" {
  name = "postgres:latest"
}

resource "docker_container" "postgres" {
  name    = "postgres"
  image   = docker_image.postgres.latest
  command = ["tail", "-f", "/dev/null"]

  ports {
    internal = 5432
    external = var.postgres_port
  }
}

### pgAdmin

resource "docker_image" "pgadmin" {
  name = "fenglc/pgadmin4:latest"
}

resource "docker_container" "pgadmin" {
  name  = "pgadmin"
  image = docker_image.pgadmin.latest

  ports {
    internal = 5050
    external = var.pgadmin_port
  }
}

### Speedtest

resource "docker_image" "speedtest" {
  name = "aleksyglvnw/speedtest:latest"
}

resource "docker_container" "speedtest" {
  name  = "speedtest"
  image = docker_image.speedtest.latest

  volumes {
    host_path      = "${abspath(path.module)}/logs"
    container_path = "/app"
  }
}
