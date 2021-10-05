resource "aws_launch_configuration" "web" {
  name_prefix                 = "web-"
  image_id                    = "ami-0a8e758f5e873d1c1"
  instance_type               = "t2.micro"
  key_name                    = aws_key_pair.my_instance_key_pair.key_name
  security_groups             = [aws_security_group.demosg.id]
  associate_public_ip_address = true

  user_data                   = <<-EOF
                #!/bin/bash
                echo "Hello, World" > index.html
                nohup busybox httpd -f -p "${var.server_port}" &
                EOF

  lifecycle {
    create_before_destroy = true
  }
}
