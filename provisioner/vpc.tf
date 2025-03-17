resource "aws_vpc" "pavan" {
  cidr_block = var.pavan_vpc

  tags = {
    Name = "pavan"
  }
}
resource "aws_subnet" "mani" {
  vpc_id            = aws_vpc.pavan.id
  count             = length(var.subnet_range_cidrs)
  availability_zone = var.availability_zone_subnets[count.index]
  cidr_block        = var.subnet_range_cidrs[count.index]

  tags = {
    Name = var.subnets_names[count.index]
  }
}
resource "aws_internet_gateway" "veeruigw" {
  vpc_id = aws_vpc.pavan.id

  tags = {
    Name = "veeruigw"
  }
}
resource "aws_route_table" "babu" {
  vpc_id = aws_vpc.pavan.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.veeruigw.id
  }
  tags = {
    Name = "babu"
  }
}

resource "aws_route_table_association" "veerababu" {
  subnet_id      = aws_subnet.mani[0].id
  route_table_id = aws_route_table.babu.id
}
resource "aws_security_group" "kumar" {
  name        = "kumar"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.pavan.id

  ingress {
    description = "TLS from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.pavan.cidr_block]
  }
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.pavan.cidr_block]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "kumar"
  }
}





