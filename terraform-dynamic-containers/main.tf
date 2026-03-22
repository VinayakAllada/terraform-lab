terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}

# Pull nginx image
resource "docker_image" "nginx" {
  name = "nginx:latest"
}

# Dynamic containers
module "nginx_containers" {
  source = "../assignment4/modules/nginx_container"

  for_each = {
    for c in var.container_config :
    c.name => c
  }

  container_name = each.value.name
  container_port = each.value.port
  image_name     = docker_image.nginx.name
}