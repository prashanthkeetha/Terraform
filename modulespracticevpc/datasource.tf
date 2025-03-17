/*data "aws_vpc" "pavan" {
  cidr_block = "10.0.0.0/16"
}
data "aws_subnet" "mani" {
  state      = "available"
  cidr_block = "10.0.0.0/24"



}
output "pavan" {
  value = data.aws_vpc.pavan

}
output "mani" {
  value = data.aws_subnet.mani

}
*/