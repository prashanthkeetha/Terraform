resource "aws_vpc" "prasanth" {
  cidr_block = var.prasanth_vpc_info.vpc_cidr
  tags = {
    Name = "abhi"
  }
}

resource "aws_subnet" "subnets" {
  count             = length(var.prasanth_vpc_info.subnet_names)
  cidr_block        = cidrsubnet(var.prasanth_vpc_info.vpc_cidr, 8, count.index)
  availability_zone = "${var.region}${var.prasanth_vpc_info.subnet_azs[count.index]}"
  vpc_id            = local.vpc_id
  depends_on = [
    aws_vpc.prasanth
  ]
  tags = {
    Name = var.prasanth_vpc_info.subnet_names[count.index]
  }
}

resource "aws_internet_gateway" "prasanth_igw" {
  vpc_id = local.vpc_id
  tags = {
    Name = "prasanth_igw"
  }
  depends_on = [
    aws_vpc.prasanth
  ]
}

resource "aws_route_table" "private" {
  vpc_id = local.vpc_id
  tags = {
    Name = "private"
  }
  depends_on = [
    aws_subnet.subnets
  ]
}

resource "aws_route_table" "public" {
  vpc_id = local.vpc_id
  tags = {
    Name = "public"
  }
  route {
    cidr_block = local.anywhere
    gateway_id = aws_internet_gateway.prasanth_igw.id
  }
  depends_on = [
    aws_subnet.subnets
  ]
}

data "aws_subnets" "public" {

  filter {
    name   = "tag:Name"
    values = var.prasanth_vpc_info.public_subnets
  }
  filter {
    name   = "vpc-id"
    values = [local.vpc_id]
  }
  depends_on = [
    aws_subnet.subnets
  ]
}

data "aws_subnets" "private" {

  filter {
    name   = "tag:Name"
    values = var.prasanth_vpc_info.private_subnets
  }
  filter {
    name   = "vpc-id"
    values = [local.vpc_id]
  }
  depends_on = [
    aws_subnet.subnets
  ]
}

resource "aws_route_table_association" "private_associations" {

  count          = length(var.prasanth_vpc_info.private_subnets)
  route_table_id = aws_route_table.private.id
  subnet_id      = data.aws_subnets.private.ids[count.index]
  depends_on = [

    aws_vpc.prasanth,
    aws_subnet.subnets
  ]
}

resource "aws_route_table_association" "public_associations" {
  count          = length(var.prasanth_vpc_info.public_subnets)
  route_table_id = aws_route_table.public.id
  subnet_id      = data.aws_subnets.public.ids[count.index]
  depends_on = [

    aws_vpc.prasanth,
    aws_subnet.subnets
  ]
}


