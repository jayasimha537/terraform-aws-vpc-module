resource "aws_subnet" "public_subnets" {
  vpc_id                  = "${aws_vpc.vpc.id}"
  cidr_block              = "${var.vpc_cidr_base}.${ count.index  + 11 }.0/24"
  availability_zone = data.aws_availability_zones.available.names[count.index]
  map_public_ip_on_launch = true

  count = var.public_subnets_count

  tags = "${merge(
			"${var.default_tags}","${var.public_subnet_tags}", local.custom_tags,
			map(
			  "Name", "${var.projectName}_${var.environmentName}_public_subnet"
			)
		  )}"
}

resource "aws_subnet" "private_subnets" {
  vpc_id                  = "${aws_vpc.vpc.id}"
  cidr_block              = "${var.vpc_cidr_base}.${ count.index  + 21 }.0/24"
  availability_zone = data.aws_availability_zones.available.names[count.index]
  map_public_ip_on_launch = false

  count = var.private_subnets_count

  tags = "${merge(
			"${var.default_tags}","${var.private_subnet_tags}", local.custom_tags,
			map(
			  "Name", "${var.projectName}_${var.environmentName}_private_subnet"
			)
		  )}"
}

