resource "aws_instance" "monitoring" {
  ami                    = var.monitoring_ami
  instance_type          = "t2.micro"
  key_name               = var.key_name
  subnet_id              = aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.devops_sg.id]

  tags = { Name = "Monitoring-Server" }

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              amazon-linux-extras install docker -y
              service docker start
              usermod -aG docker ec2-user
              docker run -d -p 9090:9090 prom/prometheus:latest
              docker run -d -p 3000:3000 grafana/grafana:latest
              EOF
}
