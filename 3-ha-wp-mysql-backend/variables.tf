variable "aws_region" {}
variable "aws_profile" {}

variable "rds_identifier" {}
variable "db_instance_type" {}
variable "dbname" {}
variable "dbuser" {}
variable "dbpassword" {}
variable "db_engine" {}
variable "db_version" {}
variable "db_storage" {}
variable "rds_subnet_group_name" {}

variable "instance_name" {}
variable "instance_type" {}
variable "instance_count" {}
variable "ami_id" {}
variable "dev_host_label" {}

variable "localip" {}
variable "ssh_user_name" {}
variable "ssh_key_name" {}
variable "ssh_key_path" {}
variable "public_key_path" {}

variable "vpc_cidr" {}
variable "cidrs" {
  type = "map"
}

variable "domain_name" {}

variable "elb_healthy_threshold" {}
variable "elb_unhealthy_threshold" {}
variable "elb_timeout" {}
variable "elb_interval" {}

variable "asg_max" {}
variable "asg_min" {}
variable "asg_grace" {}
variable "asg_hct" {}
variable "asg_cap" {}

variable "asg_instance_type" {}
variable "delegation_set" {}
