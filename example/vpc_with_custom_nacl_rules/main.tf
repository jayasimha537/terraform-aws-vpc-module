# Specify the provider and access details
provider "aws" {
  region = "us-east-1"
}



module "dev_vpc" {
  source = "git::https://github.com/jayasimha537/terraform-aws-vpc-module.git"
  projectName = "myproject"
  environmentName = "dev"
  vpc_cidr = "10.0.0.0/16"
  public_inbound_acl_rules = var.public_inbound_acl_rules
  public_outbound_acl_rules = var.public_outbound_acl_rules
  private_inbound_acl_rules = var.private_inbound_acl_rules
  private_outbound_acl_rules = var.private_outbound_acl_rules
  enable_nat_gw = true
  default_tags = {
    "Author" = "Jayasimha"
  }

}

