provider "aws" {
region = "ap-south-1"
access_key = "AKIA2KB4Y26QZUDDVLUO"
secret_key = "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"
}

resource "aws_instance" "one" {
  ami          = "ami-078efad6f7ec18b8a"
  instance_type   = "t2.micro"
  key_name        = "terrakeypair"
  vpc_security_group_ids = [aws_security_group.three.id]
  availability_zone = "ap-south-1a"
  user_data       = <<EOF
#!/bin/bash
sudo -i
yum install httpd -y
systemctl start httpd
chkconfig httpd on
echo "hai all this is my website created by terraform infrastructurte by raham sir server-1" > /var/www/html/index.html
EOF
  tags = {
    Name = "server-1"
  }
}

resource "aws_instance" "two" {
  ami             = "ami-078efad6f7ec18b8a"
  instance_type   = "t2.micro"
  key_name        = "terrakeypair"
  vpc_security_group_ids = [aws_security_group.three.id]
  availability_zone = "ap-south-1b"
  user_data       = <<EOF
#!/bin/bash
sudo -i
yum install httpd -y
systemctl start httpd
chkconfig httpd on
echo "hai all this is my website created by terraform infrastructurte by raham sir server-2" > /var/www/html/index.html
EOF
  tags = {
    Name = "server-2"
  }
}
