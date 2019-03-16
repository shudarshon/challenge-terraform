################################################################################
## WebApp RDS
################################################################################

resource "aws_db_instance" "RDSWebApp" {
  publicly_accessible    = true
  allocated_storage      = "${var.allocated_storage}"
  engine                 = "${var.db_engine}"
  engine_version         = "${var.db_version}"
  instance_class         = "${var.db_instance_type}"
  name                   = "${var.dbname}"
  identifier             = "${var.identifier}"
  username               = "${var.dbuser}"
  password               = "${var.dbpassword}"
  db_subnet_group_name   = "${data.terraform_remote_state.shared_vpc_local.rds_subnet_group_name[0]}"
  vpc_security_group_ids = [
    "${data.terraform_remote_state.shared_sg_local.dhaka_office_sg_id}",
    "${data.terraform_remote_state.shared_sg_local.rds_mysql_sg_id}"
  ]
  skip_final_snapshot    = true
}
