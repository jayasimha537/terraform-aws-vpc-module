output "vpc_id" {
  value = "${aws_vpc.vpc.id}"
}
output "vpc_cidr" {
  value = "${aws_vpc.vpc.cidr_block}"
}

output "private_subnet_id_list" {
  value = aws_subnet.private_subnets.*.id
}
