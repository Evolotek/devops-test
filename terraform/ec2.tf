resource "aws_instance" "app" {
  ami                         = "ami-0c02fb55956c7d316" # Amazon Linux 2
  instance_type               = var.instance_type
  key_name                    = var.key_name
  vpc_security_group_ids      = [aws_security_group.ec2_sg.id]

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              amazon-linux-extras install docker -y
              service docker start
              usermod -a -G docker ec2-user
              curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" \
              -o /usr/local/bin/docker-compose
              chmod +x /usr/local/bin/docker-compose

              mkdir -p /app
              cd /app
              git clone https://github.com/Evolotek/devops-test.git app
              cd app
              docker-compose up -d
              EOF

  tags = {
    Name = "SipstrAppInstance"
  }
}