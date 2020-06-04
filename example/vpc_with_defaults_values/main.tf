# Specify the provider and access details
provider "aws" {
  region = var.aws_region
}



module "dev_vpc" {
  source = "git::https://github.com/jayasimha537/terraform-aws-vpc-module.git"
  default_tags = {
    "Author" = "Jayasimha"
  }

}

