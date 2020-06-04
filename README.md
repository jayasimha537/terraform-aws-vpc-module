# terraform-aws-vpc-module
AWS VPC MODULE - VPC SUBNETS NAT ROUTE_TABLE NACL

Using this module we can easily create , modify and destroy the AWS VPC and its components.

To create VPC with default vaules i.e., VPC,2 private subnets, 2 public subnets, private NACL, public NACL and Roulte tables. Please refer variable.tf file for more info on default values.

# vpc_with_default_values.tf 
```sh
module "dev_vpc" {
  source = "git::https://github.com/jayasimha537/terraform-aws-vpc-module.git"
  default_tags = {
    "Author" = "Jayasimha"
  }
}

```
# Terraform commands
```sh
$ terraform init
$ terraform plan
$ terraform apply
```

# Options
To enable NAT need to set below variable default value is false (See example code)
```sh
enable_nat_gw  = true
```
To set private and public subnet count. Default is 2
```sh
public_subnets_count = 2
private_subnets_count = 2
```
To add custom nacl rules. default is enable all
```sh
public_inbound_acl_rules = [
      {
        rule_number = 900
        rule_action = "allow"
        from_port   = 1
        to_port     = 65535
        protocol    = -1
        cidr_block  = "0.0.0.0/0"
      }
    ]
  public_outbound_acl_rules = [
      {
        rule_number = 900
        rule_action = "allow"
        from_port   = 1
        to_port     = 65535
        protocol    = -1
        cidr_block  = "0.0.0.0/0"
      }
    ]
  private_inbound_acl_rules = [
      {
        rule_number = 900
        rule_action = "allow"
        from_port   = 1
        to_port     = 65535
        protocol    = -1
        cidr_block  = "0.0.0.0/0"
      }
    ]
  private_outbound_acl_rules = [
      {
        rule_number = 900
        rule_action = "allow"
        from_port   = 1
        to_port     = 65535
        protocol    = -1
        cidr_block  = "0.0.0.0/0"
      }
    ]
```
