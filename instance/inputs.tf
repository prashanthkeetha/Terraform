variable "region" {
  type    = string
  default = "us-west-2"
}
variable "activitymar" {
  type    = string
  default = "10.0.0.0/16"
}
variable "subnetsmar_cidrs" {
  type    = list(string)
  default = ["10.0.0.0/24", "10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}
variable "subnets" {
  type    = list(string)
  default = ["subnet1", "subnet2", "subnet3", "subnet4"]

}
variable "avilability_zone-subnets" {
  type    = list(string)
  default = ["a", "b", "c", "a"]
}
variable "public-subnets-cidr" {
  type    = list(string)
  default = ["10.0.0.0/24", "10.0.1.0/24"]

}
variable "private-subnets-cidr" {
  type    = list(string)
  default = ["10.0.2.0/24", "10.0.3.0/24"]

}
variable "public-subunet-association" {
  type    = list(string)
  default = ["subnet1", "subnet2"]

}
variable "private-subnet-association" {
  type    = list(string)
  default = ["subnet3", "subnet4"]
}

variable "id_rsa" {
  type    = string
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQD5HqorU9079pviD4MZtmb7N/yo+Z2mVErud+sRyFq6jA8Z+B00rkiQe3QSAqzha6A+RAIEWYF4VglDoXjWZe1bMGhXgeVUnNHO55oQHefnRU1KPohJP1/qG0gFp5mtwAidyghAGrBB4UPUM2pRrB9u8/VT7pqZKiOp5uNL6l5LKA1KkoNtM4CpbO9mYkXjnSODQMhzNR5w7ouWMz6FP8lJrz56KtgJA0EUKWpislO2Z5fBElApOUisTCkGG4EFxSAxbLVk1ul4W0Jtt1jRzhi0lx6D6b52bbblWF4McBM+JbyIqu/iR+61j8zKnO8yHfoFOZ7hEPwwFbTvUdm6p3dcMuW5nDvLZeps8KFxy+RYmU4MKdXoCi7fG+JvNvoIyEdOjfS/aXA4RLGAq7QCWoHfPrSwH/k0lgW5aPbqQ+s3f+Bj1an/Ec02dMhevMXxwyk8og5T+2VQgm+tcvsgvFlKFwmJtQghK4fxkDYOhWr07QntsoNcjMbtaTqMQMKCylc= DELL@DESKTOP-3O4K2B7"

}
variable "myinstance_ec2_subnet" {
  type = string

}