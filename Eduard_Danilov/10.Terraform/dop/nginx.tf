resource "docker_container" "nginx-server" {
  count = var.count_servers
  name  = format("server-%02d", count.index + 1)
  image = "nginx"

  ports {
    internal = "80"
    external = format(var.external + count.index)
  }
}

#/usr/share/nginx/html/index.html