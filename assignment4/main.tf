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

# Module Call 1
module "nginx1" {
  #tells Terraform where to find the module code
  source = "./modules/nginx_container"

  container_name = "nginx-1"
  container_port = 8081
  image_name     = "nginx:latest"
}

# Module Call 2
module "nginx2" {
  source = "./modules/nginx_container"

  container_name = "nginx-2"
  container_port = 8082
  image_name     = "nginx:latest"
}