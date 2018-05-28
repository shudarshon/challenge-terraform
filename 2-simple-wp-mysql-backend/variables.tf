variable "aws_profile" {}
variable "aws_region" {}

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
variable "public_subnet_cidr" {}
variable "private1_subnet_cidr" {}
variable "private2_subnet_cidr" {}
variable "rds1_subnet" {}
variable "rds2_subnet" {}
variable "rds3_subnet" {}
