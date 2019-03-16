output "vpc_id" {
  value = "${aws_vpc.vpc.id}"
}

output "vpc_cidr" {
  value = "${aws_vpc.vpc.cidr_block}"
}

output "public_subnet_id" {
  value = [
    "${aws_subnet.subnet_1_public.*.id}",
    "${aws_subnet.subnet_2_public.*.id}"
  ]
}

output "webapp_subnet_id" {
  value = [
    "${aws_subnet.subnet_1_private_webapp.*.id}",
    "${aws_subnet.subnet_2_private_webapp.*.id}"
  ]
}

output "webapp_subnet_cidr" {
  value = [
    "${aws_subnet.subnet_1_private_webapp.*.cidr_block}",
    "${aws_subnet.subnet_2_private_webapp.*.cidr_block}"
  ]
}

output "rds_subnet_id" {
  value = [
    "${aws_subnet.subnet_1_public_rds.*.id}",
    "${aws_subnet.subnet_2_public_rds.*.id}"
  ]
}

output "cislave_subnet_id" {
  value = [
    "${aws_subnet.subnet_1_private_cislave.*.id}",
    "${aws_subnet.subnet_2_private_cislave.*.id}"
  ]
}

output "spare_subnet_id" {
  value = [
    "${aws_subnet.subnet_1_private_spare.*.id}",
    "${aws_subnet.subnet_2_private_spare.*.id}"
  ]
}

output "rds_subnet_group_name" {
  value = "${aws_db_subnet_group.rds_subnetgroup.*.name}"
}
