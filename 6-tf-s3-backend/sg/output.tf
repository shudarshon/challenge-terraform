output "local_vpc_http_sg_id" {
  value = "${aws_security_group.local_vpc_http_sg.*.id}"
}

output "user_sg_id" {
  value = "${aws_security_group.user_sg.*.id}"
}

output "service_webhook_sg_id" {
  value = "${aws_security_group.service_webhook_sg.*.id}"
}

output "webserver_sg_id" {
  value = "${aws_security_group.webserver_sg.*.id}"
}

output "rds_mysql_sg_id" {
  value = "${aws_security_group.mysql_rds_sg.*.id}"
}

output "rds_psql_sg_id" {
  value = "${aws_security_group.psql_rds_sg.*.id}"
}
