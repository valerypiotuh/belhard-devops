terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "2.19.0"
    }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}