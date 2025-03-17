variable "region" {
  type    = string
  default = "us-west-2"
}
variable "pavan_vpc" {
  type    = string
  default = "10.0.0.0/16"
}
variable "availability_zone_subnets" {
  type    = list(string)
  default = ["us-west-2a", "us-west-2b", "us-west-2c", "us-west-2a"]
}
variable "subnets_names" {
  type    = list(string)
  default = ["mani", "pavan", "avi", "bhuvi"]

}
variable "subnet_range_cidrs" {
  type    = list(string)
  default = ["10.0.0.0/24", "10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}