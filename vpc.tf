resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr
  tags = "${merge(
			"${var.default_tags}", local.custom_tags,
			map(
			  "Name", "${var.projectName}_${var.environmentName}_vpc"
			)
		  )}"
}


resource "aws_internet_gateway" "igw" {
  vpc_id = "${aws_vpc.vpc.id}"
  tags = "${merge(
			"${var.default_tags}", local.custom_tags,
			map(
			  "Name", "${var.projectName}_${var.environmentName}_igw"
			)
		  )}"
}

resource "aws_eip" "nat_eip" {
  count = var.enable_nat_gw ? 1 : 0
  vpc = true
  depends_on = ["aws_internet_gateway.igw"]
  tags = "${merge(
			"${var.default_tags}", local.custom_tags,
			map(
			  "Name", "${var.projectName}_${var.environmentName}_nat_eip"
			)
		  )}"
}

resource "aws_nat_gateway" "nat" {
  count = var.enable_nat_gw ? 1 : 0
  allocation_id = "${aws_eip.nat_eip[count.index].id}"
  subnet_id = "${aws_subnet.public_subnets.0.id}"
  depends_on = ["aws_internet_gateway.igw"]
  tags = "${merge(
			"${var.default_tags}", local.custom_tags,
			map(
			  "Name", "${var.projectName}_${var.environmentName}_nat_gw"
			)
		  )}"
}



