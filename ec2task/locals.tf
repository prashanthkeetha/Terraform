locals {
  vpc_id    = aws_vpc.prasanth.id
  anywhere  = "0.0.0.0/0"
  tcp       = "tcp"
  ssh_port  = 22
  http_port = 80
  ami_id    = data.aws_ami_ids.ubuntu_2204.ids[0]
}