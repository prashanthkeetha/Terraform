variable "region" {
  type    = string
  default = "us-west-2"
}

variable "prasanth_vpc_info" {
  type = object({
    vpc_cidr        = string,
    subnet_names    = list(string),
    subnet_azs      = list(string),
    public_subnets  = list(string),
    private_subnets = list(string),
    web_ec2_subnet  = string
  })
  default = {
    subnet_azs      = ["a", "b", "a", "b"]
    subnet_names    = ["app1", "app2"]
    vpc_cidr        = "192.168.0.0/16"
    public_subnets  = []
    private_subnets = ["app1", "app2"]
    web_ec2_subnet  = ""
  }

}