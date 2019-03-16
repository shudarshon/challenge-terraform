variable "aws_region" {}

variable "service_cidr" {
  type = "list"
}

variable "user_cidr" {
  type = "list"
}

variable "user_sg_name" {}
variable "service_webhook_sg_name" {}
variable "webserver_sg_name" {}
variable "rds_mysql_sg_name" {}
variable "rds_psql_sg_name" {}
variable "local_vpc_http_sg_name" {}
