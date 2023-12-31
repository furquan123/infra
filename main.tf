provider "aws" {
region = "ap-south-1"
access_key = "AKIAWDHXRCZ4RY7C2BPQ"
secret_key = "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"
}

resource "aws_instance" "one" {
  ami             = "ami-0a5ac53f63249fba0"
  instance_type   = "t2.micro"
  key_name        = "devops"
  vpc_security_group_ids = [aws_security_group.five.id]
  availability_zone = "ap-south-1a"
  user_data       = <<EOF
#!/bin/bash
sudo -i
yum install httpd -y
systemctl start httpd
chkconfig httpd on
echo "hai all this is my app created by terraform infrastructurte by furkhan sir-1" > /var/www/html/index.html
EOF
  tags = {
    Name = "web-server-1"
  }
}

resource "aws_instance" "two" {
  ami             = "ami-0a5ac53f63249fba0"
  instance_type   = "t2.micro"
  key_name        = "devops"
  vpc_security_group_ids = [aws_security_group.five.id]
  availability_zone = "ap-south-1a"
  user_data       = <<EOF
#!/bin/bash
sudo -i
yum install httpd -y
systemctl start httpd
chkconfig httpd on
echo "hai all this is my website created by terraform infrastructurte by furkhan server-2" > /var/www/html/index.html
EOF
  tags = {
    Name = "web-server-2"
  }
}

resource "aws_instance" "three" {
  ami             = ""ami-0a5ac53f63249fba0"
  instance_type   = "t2.large"
  key_name        = "devops"
  vpc_security_group_ids = [aws_security_group.five.id]
  availability_zone = "ap-south-1b"
  tags = {
    Name = "app-server-1"
  }
}

resource "aws_instance" "four" {
  ami             = "ami-0a5ac53f63249fba0"
  instance_type   = "t2.micro"
  key_name        = "devops"
  vpc_security_group_ids = [aws_security_group.five.id]
  availability_zone = "ap-south-1a"
  tags = {
    Name = "app-server-2"
  }
}

resource "aws_security_group" "five" {
  name = "furkhan-elb"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_s3_bucket" "six" {
  bucket = "furkhan-bucket"
}

resource "aws_iam_user" seven"
name = "furkhan1512"

resource "aws_ebs_volume" "eight" {
 availability_zone = "ap-south-1a"
  size = 20
  tags = {
    Name = "furkhan-ebs"
  }
}
