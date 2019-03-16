variable "aws_region" {}

variable "vpc_cidr" {}
variable "vpc_name" {}

variable "public_rt_name" {}
variable "private_rt_name" {}

variable "rds_subnetgroup_name" {}

variable "cidrs" {
  type = "map"
}
