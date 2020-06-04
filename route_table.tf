resource "aws_route_table" "public_rt" {
  vpc_id = "${aws_vpc.vpc.id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.igw.id}"
  }
  tags = "${merge(
			"${var.default_tags}", local.custom_tags,
			map(
			  "Name", "${var.projectName}_${var.environmentName}_public_rt"
			)
		  )}"
}

resource "aws_route_table" "private_rt" {
  vpc_id = "${aws_vpc.vpc.id}"

  tags = "${merge(
			"${var.default_tags}", local.custom_tags,
			map(
			  "Name", "${var.projectName}_${var.environmentName}_private_rt"
			)
		  )}"
}

resource "aws_route" "private_route" {
  count = var.enable_nat_gw ? 1 : 0
  route_table_id            = "${aws_route_table.private_rt.id}"
  destination_cidr_block    = "0.0.0.0/0"
  nat_gateway_id = "${aws_nat_gateway.nat[0].id}"
  depends_on = ["aws_internet_gateway.igw","aws_nat_gateway.nat"]
}
resource "aws_route_table_association" "public_rta" {
    count = var.public_subnets_count
    subnet_id = element(aws_subnet.public_subnets.*.id, count.index)
    route_table_id = "${aws_route_table.public_rt.id}"
}

resource "aws_route_table_association" "private_rta" {
    count = var.private_subnets_count
    subnet_id = element(aws_subnet.private_subnets.*.id, count.index)
    route_table_id = "${aws_route_table.private_rt.id}"
}
