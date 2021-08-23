# Creates a ECS Cluster, Service and Task Definition
# deploying a container


#creating container cluster
resource "aws_ecs_cluster" "default" {
  name = "${var.container_name}-Cluster"
  capacity_providers = [ "FARGATE", "FARGATE_SPOT" ]
  default_capacity_provider_strategy {
        capacity_provider = "FARGATE"
    }
}



# loading the container configuration file 

data  "template_file" "container_config"{
    template = file("${var.container_template_path}")

    vars = {
        container_name = var.container_name
        docker_image_url = var.docker_image_name
        container_port = var.container_port
        memory = var.container_memory
        aws_region = var.region
        health_check     = var.health_check
    }
}


#task definition

resource "aws_ecs_task_definition" "default" {
  family = var.container_name
  container_definitions = data.template_file.container_config.rendered
  requires_compatibilities = [ "FARGATE" ]
  network_mode             = "awsvpc"
  memory                   = var.container_memory      
  cpu                      = var.cpu
}


# service

resource "aws_ecs_service" "default" {
    
    name = var.Service_Name
    cluster = aws_ecs_cluster.default.arn
    task_definition = aws_ecs_task_definition.default.arn
    launch_type = "FARGATE"
    desired_count = var.desired_count
    network_configuration {
      subnets          = [aws_default_subnet.default_subnet_a.id, aws_default_subnet.default_subnet_b.id, aws_default_subnet.default_subnet_c.id]
      assign_public_ip = true
      security_groups = [aws_security_group.container_service.id]
    }
}