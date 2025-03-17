resource "aws_vpc" "activitymar" {
  cidr_block = var.activitymar

  tags = {
    Name = "activitymar"
  }
}
resource "aws_subnet" "subnets" {
  vpc_id            = aws_vpc.activitymar.id
  count             = length(var.subnetsmar_cidrs)
  cidr_block        = var.subnetsmar_cidrs[count.index]
  availability_zone = "${var.region}${var.avilability_zone-subnets[count.index]}"
  tags = {
    Name = var.subnets[count.index]
  }
}
