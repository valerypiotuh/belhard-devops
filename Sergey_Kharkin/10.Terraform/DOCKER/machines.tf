# Описание контейнера с postgresql

# Pulls the image
resource "docker_image" "postgres" {
  name = "postgres:latest"
}

# Create a container
resource "docker_container" "postgres" {
  image = docker_image.postgres.latest
  name  = "postgres"
  restart = "always"
  tty   = true
  command = ["tail", "-f", "/dev/null"]

  ports {
    internal = 5432
    external = var.postgres_port
  }
}

# Описание контейнера с pgadmin
# Pulls the image
resource "docker_image" "pgadmin4" {
  name = "fenglc/pgadmin4:latest"
  #name = "dpage/pgadmin4:latest"

}

# Create a container
resource "docker_container" "pgadmin4" {
  image = docker_image.pgadmin4.latest
  name  = "pgadmin"
  #tty   = true
  #command = ["tail", "-f", "/dev/null"]

  ports {
    internal = 5050
    external = var.pgadmin_port
  }

}


# Описание контейнера с nginx
# Pulls the image
resource "docker_image" "nginx" {
  name = "nginx:latest"
}

# Create a container
resource "docker_container" "nginx" {
  image = docker_image.nginx.latest
  name  = "nginx_custom"

  upload {
    content = "${file("${path.module}/index.html")}"

    file = "/usr/share/nginx/html/index.html"
  }

  ports {
    internal = 80
    external = var.nginx_port
  }
}



# Описание контейнера с моим образом
# Pulls the image
resource "docker_image" "myimage" {
  name = "sergkharkin/speedtest:latest"
}

# Create a container
resource "docker_container" "myimage" {
  image = docker_image.myimage.latest
  name  = "myimage"
  tty   = true
  command = ["tail", "-f", "/dev/null"]
}
