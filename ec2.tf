resource "aws_instance" "web_server" {
  ami                    = "ami-xxxxxxxxxxxx"  
  instance_type          = "t2.micro"           
  subnet_id              = aws_subnet.public.id
  associate_public_ip_address = true

  # Security group for the instance
  vpc_security_group_ids = [aws_security_group.web_sg.id]

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y httpd
              systemctl start httpd
              systemctl enable httpd
              EOF

  tags = {
    Name = "WebServerInstance"
  }
}
