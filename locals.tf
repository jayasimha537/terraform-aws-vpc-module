locals {
  custom_tags = {
    "project" = "${var.projectName}",
    "envronment" = "${var.environmentName}"
  }

  vpc_cidr = "${var.vpc_cidr}"
}
