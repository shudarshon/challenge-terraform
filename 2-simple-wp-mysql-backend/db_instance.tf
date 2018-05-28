# RDS

resource "aws_db_instance" "RDSWebApp" {
  identifier                = "${var.rds_identifier}"
  multi_az                  = "false"
  allocated_storage         = "${var.db_storage}"
  engine                    = "${var.db_engine}"
  engine_version            = "${var.db_version}"
  instance_class            = "${var.db_instance_type}"
  name                      = "${var.dbname}"
  username                  = "${var.dbuser}"
  password                  = "${var.dbpassword}"
  storage_type              = "gp2"
  skip_final_snapshot       = true                                                    #without this option terraform destroy command throws some error
  db_subnet_group_name      = "${aws_db_subnet_group.rds_subnet_group.name}"
  vpc_security_group_ids    = ["${aws_security_group.RDS.id}"]
}
