
#allowing all the services to be started
# Customize according to the environment

resource "aws_security_group" "container_service" {
        name = "Terraform-Security"
        ingress {

                from_port = 0
                to_port = 0
                protocol = -1
                cidr_blocks = ["0.0.0.0/0"]

                }

	egress {
		   from_port = 0
		   to_port = 0
		   protocol = -1
		   cidr_blocks = ["0.0.0.0/0"]
		}
    }