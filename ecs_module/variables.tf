# Consits of required variables for deploying the containers

variable "container_name" {
    type = string
    description = "Name of the cluster"
}

variable "docker_image_name" {
  type = string
  description = "Docker image name use the complete format example docker.io/jhon123/myapp:latest, quay.io/jhon123/myapp:v2"
}

variable "container_port" {
  description = "Container port for exposing the services"
  default = 80
}


variable "container_memory" {
    description = "Memory required for the container"
    default = 512
}

variable "cpu" {
  description = "CPU required to process the request from container"
  default = 256
}

variable "service_name" {
    type = string
    description = "Name of the service"
}


variable "container_template_path" {
  type = string
  description = "Path for the container template"
  default = "templates/config.json"
}


variable "region" {
    type = string
    description = "AWS region of your choice"
}
variable "availability_zones" {
    type = list(string)
    description = "Name of the availability zone example ap-south-1a"
    default = ["ap-south-1a", "ap-south-1b", "ap-south-1c"]
}

variable "health_check" {
  description = "Health check to determine if a spawned task is operational."
  default = "curl -Is http://localhost:80/ | head -1 " 
}



variable "desired_count" {
  default = 1
}