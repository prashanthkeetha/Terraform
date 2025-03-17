variable "region" {
  type    = string
  default = "us-west-2"

}
variable "march30" {
  type    = string
  default = "192.168.0.0/16"

}
variable "subnetsmarch30" {
  type    = list(string)
  default = ["192.168.0.0/24", "192.168.1.0/24", "192.168.2.0/24"]

}
variable "march30-subnets" {
  type    = list(string)
  default = ["subnet01", "subnets02", "subnets03"]

}
variable "march30-subnet-availability_zone" {
  type    = list(string)
  default = ["a", "a", "a"]

}