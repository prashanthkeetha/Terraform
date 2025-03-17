resource "aws_vpc" "activitymar29" {
  cidr_block = var.activitymar29

  tags = {
    Name = "activitymar29"
  }
}
resource "aws_subnet" "subnets" {
  vpc_id     = aws_vpc.activitymar29.id
  count      = length(var.subnetsmar29_cidrs)
  cidr_block = var.subnetsmar29_cidrs[count.index]
  availability_zone = "${var.region}${avilability_zone-subnets[coun.index]}"
  tags = {
    Name = var.subnets29[count.index]
  }
}



