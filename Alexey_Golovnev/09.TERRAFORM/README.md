# Конфигурация Terraform под Virtualbox

Описываем необходимые провайдеры:
##### virtualbox/providers.tf
```
terraform {
  required_providers {
    virtualbox = {
      source  = "terra-farm/virtualbox"
      version = "0.2.2-alpha.1"
    }
  }
}
```

---

Описываем создаваемые ресурсы:
##### virtualbox/main.tf
```
resource "virtualbox_vm" "node" {
  count  = var.nodes_count
  name   = format("node-%02d", count.index + 1)
  image  = "https://app.vagrantup.com/ubuntu/boxes/bionic64/versions/20180903.0.0/providers/virtualbox.box"
  cpus   = var.cpus
  memory = var.memory

  network_adapter {
    type           = "hostonly"
    host_interface = "vboxnet1"
  }
}
```

---

Описываем используемые переменные:
##### virtualbox/variables.tf
```
variable "nodes_count" {
  type    = string
  default = "1"
}

variable "cpus" {
  type    = string
  default = "1"
}

variable "memory" {
  type    = string
  default = "1024 mib"
}
```

---

Устанавливаем значения переменным:
##### virtualbox/terraform.tfvars
```
nodes_count = "3"
cpus        = "1"
memory      = "512 mib"
```

# Конфигурация Terraform под Docker

Описываем необходимые провайдеры:
##### docker/providers.tf
```
terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "2.18.0"
    }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}
```

---

Описываем создаваемые ресурсы:
##### docker/main.tf
```
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
```

---

Описываем используемые переменные:
##### docker/variables.tf
```
variable "nginx_port" {
  description = "External port for Nginx docker container."
  type        = string
  default     = "80"
}

variable "postgres_port" {
  description = "External port for PostgreSQL docker container."
  type        = string
  default     = "5432"
}

variable "pgadmin_port" {
  description = "External port for pgAdmin docker container."
  type        = string
  default     = "81"
}
```

---

Устанавливаем значения переменным:
##### docker/terraform.tfvars
```
nginx_port    = "8080"
postgres_port = "5432"
pgadmin_port  = "8081"
```

# Развертывание инфраструктуры:

В обеих папках выполняем:
```
terraform init && terraform apply -auto-approve
```
