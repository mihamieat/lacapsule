terraform {
  required_version = ">= 0.12"
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {}

resource "docker_image" "httpd" {
  name         = "httpd:latest"
  keep_locally = false
}

resource "docker_container" "httpd" {
  image = docker_image.httpd.image_id
  name  = "startwithterraform"
  ports {
    internal = 80
    external = 8888
  }
}
