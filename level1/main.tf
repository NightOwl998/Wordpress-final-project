data "aws_availability_zones" "available" {
  state = "available"
}

module "vpc" {

  source             = "terraform-aws-modules/vpc/aws"
  version            = "4.0.1"
  name               = "Artemis"
  cidr               = "192.168.0.0/16"
  azs                = data.aws_availability_zones.available.names[*]
  public_subnets     = ["192.168.0.0/24","192.168.1.0/24"]
  private_subnets    = ["192.168.2.0/24","192.168.3.0/24"]
  enable_nat_gateway = true

}
