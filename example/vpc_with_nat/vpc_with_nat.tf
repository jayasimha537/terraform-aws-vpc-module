# Specify the provider and access details
provider "aws" {
  region = var.aws_region
}



module "dev_vpc" {
  source = "git::https://github.com/jayasimha537/terraform-aws-vpc-module.git"
  enable_nat_gw = true
  default_tags = {
    "Author" = "Jayasimha"
  }

}
