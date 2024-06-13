resource "aws_instance" "test-machine" {
    ami = var.ami
    instance_type = var.instance_type
    key_name = var.key_name
    tags = {
        Name   = "${var.environment}-webserver"
        Environement = "${var.environment}"
    }
    user_data = file("${path.module}/webserver.sh") 
    vpc_security_group_ids = [aws_security_group.test-sg.id]
}

resource "aws_security_group" "test-sg" {
      name_prefix = "${var.environment}-webserver-sg"
      
      ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      }
      
      ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      }
       

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
      }
}