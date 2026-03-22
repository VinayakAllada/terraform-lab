#tells the terraform which provider to use and its version. In this case, we are using the Docker provider to manage Docker resources.
terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}
# connects the terraform to docker.
provider "docker" {}

# Pull nginx image
resource "docker_image" "nginx" {
  name = "nginx:latest"
}
# Create container
resource "docker_container" "web" {
  name  = "nginx-container"
  image = docker_image.nginx.image_id
  #mapping local host to container port
  ports {
    internal = 80
    external = 8080
  }
}

