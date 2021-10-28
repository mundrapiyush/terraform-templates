provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "inst_myinstance" {
  ami = ami-0c1a7f89451184c8b
  instance_type = "t2.micro"

  user_data = <<-EOF
  #!/bin/bash
  echo "Hello World" > index.html
  nohup busybox httpd -f -p 8080 &
  EOF
}

resource "aws_security_group" "sg_mysg" {
    name = "sg_webserver"
    ingress = [{
      from_port        = 8080
      to_port          = 8080
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
    }]
}