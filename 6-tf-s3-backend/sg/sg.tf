################################################################################
## User security group
################################################################################

resource "aws_security_group" "user_sg" {
  name = "${var.user_sg_name}"
  description = "This security group will allow all traffic from user ip"
  vpc_id = "${data.terraform_remote_state.shared_vpc_local.vpc_id}"

  #ALL TRAFFIC INBOUND

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["${var.user_cidr}"]
  }

  #ALL TRAFFIC OUTBOUND

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["${var.user_cidr}"]
  }

}

################################################################################
## Service webhook security group
################################################################################

resource "aws_security_group" "service_webhook_sg" {
  name = "${var.service_webhook_sg_name}"
  description = "This security group will allow webhook traffic from service webhook server"
  vpc_id = "${data.terraform_remote_state.shared_vpc_local.vpc_id}"

  #HTTP INBOUND

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["${var.service_cidr}"]
  }

  #HTTPS INBOUND

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["${var.service_cidr}"]
  }

  #HTTP OUTBOUND

  egress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["${data.terraform_remote_state.shared_vpc_local.vpc_cidr}"]
  }

  #HTTPS OUTBOUND

  egress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["${data.terraform_remote_state.shared_vpc_local.vpc_cidr}"]
  }
}

################################################################################
## Webserver security group
################################################################################

resource "aws_security_group" "webserver_sg" {
  name = "${var.webserver_sg_name}"
  description = "This security group will allow webserver traffic from anywhere"
  vpc_id = "${data.terraform_remote_state.shared_vpc_local.vpc_id}"

  #HTTP INBOUND

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  #HTTPS INBOUND

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  #HTTP OUTBOUND

  egress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  #HTTPS OUTBOUND

  egress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

################################################################################
## mySql RDS security group
################################################################################

resource "aws_security_group" "mysql_rds_sg" {
  name = "${var.rds_mysql_sg_name}"
  description = "This security group will allow mysql rds traffic from webapp subnet"
  vpc_id = "${data.terraform_remote_state.shared_vpc_local.vpc_id}"

  #MySQL INBOUND

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = [
      "${data.terraform_remote_state.shared_vpc_local.webapp_subnet_cidr}"
    ]
  }

  #MySQL OUTBOUND

  egress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

################################################################################
## PgSQL RDS security group
################################################################################

resource "aws_security_group" "psql_rds_sg" {
  name = "${var.rds_psql_sg_name}"
  description = "This security group will allow postgres rds traffic from webapp subnet"
  vpc_id = "${data.terraform_remote_state.shared_vpc_local.vpc_id}"

  #PgSQL INBOUND

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = [
      "${data.terraform_remote_state.shared_vpc_local.webapp_subnet_cidr}"
    ]
  }

  #PgSQL OUTBOUND

  egress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

################################################################################
## Local VPC HTTP(S) security group
################################################################################

resource "aws_security_group" "local_vpc_http_sg" {
  name = "${var.local_vpc_http_sg_name}"
  description = "This security group will allow webserver traffic from local vpc"
  vpc_id = "${data.terraform_remote_state.shared_vpc_local.vpc_id}"

  #HTTP INBOUND

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["${data.terraform_remote_state.shared_vpc_local.vpc_cidr}"]
  }

  #HTTPS INBOUND

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["${data.terraform_remote_state.shared_vpc_local.vpc_cidr}"]
  }

  #HTTP OUTBOUND

  egress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["${data.terraform_remote_state.shared_vpc_local.vpc_cidr}"]
  }

  #HTTPS OUTBOUND

  egress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["${data.terraform_remote_state.shared_vpc_local.vpc_cidr}"]
  }
}
