resource "aws_instance" "sonarqube" {
  ami                    = var.sonarqube_ami
  instance_type          = "t2.medium"
  key_name               = var.key_name
  subnet_id              = aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.devops_sg.id]

  tags = { Name = "SonarQube-Server" }

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              amazon-linux-extras install docker -y
              service docker start
              usermod -aG docker ec2-user
              docker run -d -p 9000:9000 sonarqube:latest
              EOF
}
