region = "us-west-2"

prasanth_vpc_info = {
  subnet_azs      = ["a", "b", "a", "b"]
  subnet_names    = ["app1", "app2", "web1", "web2"]
  vpc_cidr        = "192.168.0.0/16"
  public_subnets  = ["web1", "web2"]
  private_subnets = ["app1", "app2"]

  web_ec2_subnet = "web1"
}

