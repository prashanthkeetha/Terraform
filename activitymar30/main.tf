resource "aws_vpc" "march30" {
  cidr_block = "var.march30"

  tags = {
    Name = march30
  }
}
resource "aws_subnet" "subnets" {
  vpc_id            = aws_vpc.march30
  count             = length(var.subnetsmarch30)
  cidr_block        = var.subnetsmarch30[count.index]
  availability_zone = "{var.region}${march30-subnets-avilability_zone[count.index]}"

  tags = {
    Name = var.march30-subnets[count.index]
  }
}