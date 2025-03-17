variable "region" {
  type    = string
  default = "us-west-2"
}
variable "activitymar29" {
  type    = string
  default = "10.0.0.0/16"
}
variable "subnetsmar29_cidrs" {
  type    = list(string)
  default = ["10.0.0.0/24", "10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24","10.0.4.0/24","10.0.5.0/24","10.0.6.0/24","10.0.7.0/24"]
}
variable "subnets29" {
  type    = list(string)
  default = ["subnet1", "subnet2", "subnet3", "subnet4","subnet5","subnet6","subnet7","subnet8"]

}
variable "avilability_zone-subnets"{
  type = list(string)
  default = [ "a","b","c","a","b","c","a","b" ]
}
variable "public-subnets-cidr" {
  type = list(string)
  default = ["10.0.0.0/24", "10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24" ]
  
}
variable "private-subnets-cidr" {
  type = list(string)
  default = [ "10.0.4.0/24","10.0.5.0/24","10.0.6.0/24","10.0.7.0/24" ]
  
}
variable "public-subunet-association" {
  type = list(string)
  default = [ "subnet1","subnet2","subnet3","subnet4" ]
  
}
variable "private-subnet-association" {
  type = list(string)
  default = [ "subnet5","subnet6","subnet7","subnet8" ]
}