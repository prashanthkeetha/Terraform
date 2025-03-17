resource "aws_security_group" "activitymar" {
  name   = "securitygroup"
  vpc_id = aws_vpc.activitymar.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
  }
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "securitygroup"
  }
  depends_on = [
    aws_vpc.activitymar
  ]
}
data "aws_ami" "myinstances" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}
data "aws_subnet" "activitymar" {
  vpc_id = aws_vpc.activitymar
  filter {
    name     = "tag:Name"
    values = activitymar_vpc_myinstance_ec2_subnet
  }

  depends_on = [
    aws_subnet.subnets
  ]
}

resource "aws_instance" "myinstance" {
  ami           = aws_ami_ids.ubuntu_2204.ids
  instance_type = "t2.micro"
  subnet_id     = [aws_security_group.activitymar.id]
  key_name = var.id_rsa

  tags = {
    Name = "myinstance"
  }
  depends_on = [
    aws_security_group.activitymar
  ]
}






