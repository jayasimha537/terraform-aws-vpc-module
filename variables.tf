
variable "projectName" {
  description = "Project Name"
  type = string
  default = "myproject"
}

variable "environmentName" {
  description = "Environment Name"
  type = string
  default = "demo"
}

variable "vpc_cidr" {
  description = "CIDR Value"
  type = string
  default = "10.0.0.0/16"
}


variable "vpc_cidr_base" {
  description = "VPC CIDR Base like 10.0"
  type = string
  default = "10.0"
}

variable "public_subnets_count" {
  description = "Number of Pulic subnets"
  type = number
  default = 2
}

variable "private_subnets_count" {
  description = "Number of Private subnets"
  type = number
  default = 2
}

variable "default_tags" {
  description = "Default tags"
  type = map 
  default = {}
}

variable "public_subnet_tags" {
  description = "Default tags"
  type = map 
  default = {}
}

variable "private_subnet_tags" {
  description = "Default tags"
  type = map 
  default = {}
}

variable "public_inbound_acl_rules" {
  description = "Public InBound NACL rules"
  type = list(map(string))
  default =  [
      {
        rule_number = 900
        rule_action = "allow"
        from_port   = 1
        to_port     = 65535
        protocol    = -1
        cidr_block  = "0.0.0.0/0"
      }
    ]
}

variable "public_outbound_acl_rules" {
  description = "Public OutBound NACL rules"
  type = list(map(string))
  default =  [
      {
        rule_number = 900
        rule_action = "allow"
        from_port   = 1
        to_port     = 65535
        protocol    = -1
        cidr_block  = "0.0.0.0/0"
      }
    ]
}

variable "private_inbound_acl_rules" {
  description = "Private InBound NACL rules"
  type = list(map(string))
  default =  [
      {
        rule_number = 900
        rule_action = "allow"
        from_port   = 1
        to_port     = 65535
        protocol    = -1
        cidr_block  = "0.0.0.0/0"
      }
    ]
}

variable "private_outbound_acl_rules" {
  description = "Private OutBound NACL rules"
  type = list(map(string))
  default =  [
      {
        rule_number = 900
        rule_action = "allow"
        from_port   = 1
        to_port     = 65535
        protocol    = -1
        cidr_block  = "0.0.0.0/0"
      }
    ]
}

variable "enable_nat_gw" {
  description = "Enable NAT IGW"
  type = bool
  default = false
}
