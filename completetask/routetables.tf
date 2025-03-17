resource "aws_route_table" "public" {
  vpc_id = aws_vpc.activitymar29.id

  route {
    cidr_block = "10.0.0.0/16"
    gateway_id = aws_internet_gateway.igw.id
    tags {
        Name = public
    }
  }
  depends_on = [
    aws_internet_gateway.igw
  ]
  }

  resource "aws_route_table" "private" {
  vpc_id = aws_vpc.activitymar29.id

  route {
    cidr_block = "10.0.0.0/16"
    gateway_id = aws_internet_gateway.igw.id
    tags {
        Name = private
    }
  }
  depends_on = [
    aws_internet_gateway.igw
  ]
  }
  resource "aws_route_table_association" "public" {
    count = length(var.public-subnet-association)
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}
resource "aws_route_table_association" "private" {
    count = length(var.private-subnet-association)
  subnet_id      = aws_subnet.private.id
  route_table_id = aws_route_table.private.id
}

