provider "aws" {
  region = "ap-south-1"
}

module "ecs_container"{
    source = "../"
    container_name = "wordpress"
    docker_image_name = "wordpress:latest"
    container_port = 80
    service_name = "Webapp"
    region = "mumbai"
    container_template_path = "container_config.json"
}