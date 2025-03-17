resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.activitymar29.id

  tags = {
    Name = "igw"
  }
  depends_on = [
    aws_vpc.activitymar29
  ]
}
