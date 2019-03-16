################################################################################
## private webapp subnets & associations
################################################################################

resource "aws_subnet" "subnet_1_private_webapp" {
  vpc_id                  = "${aws_vpc.vpc.id}"
  map_public_ip_on_launch = false
  cidr_block              = "${var.cidrs["webapp_az1"]}"
  availability_zone       = "${data.aws_availability_zones.available.names[0]}"

  tags {
    Name = "${var.cidrs["webapp_az1_name"]}"
  }
}

resource "aws_subnet" "subnet_2_private_webapp" {
  vpc_id                  = "${aws_vpc.vpc.id}"
  map_public_ip_on_launch = false
  cidr_block              = "${var.cidrs["webapp_az2"]}"
  availability_zone       = "${data.aws_availability_zones.available.names[1]}"

  tags {
    Name = "${var.cidrs["webapp_az2_name"]}"
  }
}

resource "aws_route_table_association" "private_assoc_webapp_1" {
  subnet_id      = "${aws_subnet.subnet_1_private_webapp.id}"
  route_table_id = "${aws_route_table.private_rt.id}"
}

resource "aws_route_table_association" "private_assoc_webapp_2" {
  subnet_id      = "${aws_subnet.subnet_2_private_webapp.id}"
  route_table_id = "${aws_route_table.private_rt.id}"
}

################################################################################
## public subnets and associations
################################################################################

resource "aws_subnet" "subnet_1_public" {
  vpc_id                  = "${aws_vpc.vpc.id}"
  cidr_block              = "${var.cidrs["public_az1"]}"
  map_public_ip_on_launch = true
  availability_zone       = "${data.aws_availability_zones.available.names[0]}"

  tags {
    Name = "${var.cidrs["public_az1_name"]}"
  }
}

resource "aws_subnet" "subnet_2_public" {
  vpc_id                  = "${aws_vpc.vpc.id}"
  cidr_block              = "${var.cidrs["public_az2"]}"
  map_public_ip_on_launch = true
  availability_zone       = "${data.aws_availability_zones.available.names[1]}"

  tags {
    Name = "${var.cidrs["public_az2_name"]}"
  }
}

resource "aws_route_table_association" "public_assoc_subnet_1" {
  subnet_id      = "${aws_subnet.subnet_1_public.id}"
  route_table_id = "${aws_route_table.public_rt.id}"
}

resource "aws_route_table_association" "public_assoc_subnet_2" {
  subnet_id      = "${aws_subnet.subnet_2_public.id}"
  route_table_id = "${aws_route_table.public_rt.id}"
}

################################################################################
## public rds subnets & subnet groups & associations
################################################################################

resource "aws_subnet" "subnet_1_public_rds" {
  vpc_id                  = "${aws_vpc.vpc.id}"
  cidr_block              = "${var.cidrs["rds_az1"]}"
  map_public_ip_on_launch = true
  availability_zone       = "${data.aws_availability_zones.available.names[0]}"

  tags {
    Name = "${var.cidrs["rds_az1_name"]}"
  }
}

resource "aws_subnet" "subnet_2_public_rds" {
  vpc_id                  = "${aws_vpc.vpc.id}"
  cidr_block              = "${var.cidrs["rds_az2"]}"
  map_public_ip_on_launch = true
  availability_zone       = "${data.aws_availability_zones.available.names[1]}"

  tags {
    Name = "${var.cidrs["rds_az2_name"]}"
  }
}

resource "aws_db_subnet_group" "rds_subnetgroup" {

    name = "${var.rds_subnetgroup_name}"
    subnet_ids = [
    "${aws_subnet.subnet_1_public_rds.id}",
    "${aws_subnet.subnet_2_public_rds.id}"
  ]

  tags {
    Name = "${var.rds_subnetgroup_name}"
  }
}

resource "aws_route_table_association" "public_assoc_rds_subnet_1" {
  subnet_id      = "${aws_subnet.subnet_1_public_rds.id}"
  route_table_id = "${aws_route_table.public_rt.id}"
}

resource "aws_route_table_association" "public_assoc_rds_subnet_2" {
  subnet_id      = "${aws_subnet.subnet_2_public_rds.id}"
  route_table_id = "${aws_route_table.public_rt.id}"
}

################################################################################
## private ci-slave subnets & associations
################################################################################

resource "aws_subnet" "subnet_1_private_cislave" {
  vpc_id                  = "${aws_vpc.vpc.id}"
  map_public_ip_on_launch = false
  cidr_block              = "${var.cidrs["cislave_az1"]}"
  availability_zone       = "${data.aws_availability_zones.available.names[0]}"

  tags {
    Name = "${var.cidrs["cislave_az1_name"]}"
  }
}

resource "aws_subnet" "subnet_2_private_cislave" {
  vpc_id                  = "${aws_vpc.vpc.id}"
  map_public_ip_on_launch = false
  cidr_block              = "${var.cidrs["cislave_az2"]}"
  availability_zone       = "${data.aws_availability_zones.available.names[1]}"

  tags {
    Name = "${var.cidrs["cislave_az2_name"]}"
  }
}

resource "aws_route_table_association" "private_assoc_cislave_1" {
  subnet_id      = "${aws_subnet.subnet_1_private_cislave.id}"
  route_table_id = "${aws_route_table.private_rt.id}"
}

resource "aws_route_table_association" "private_assoc_cislave_2" {
  subnet_id      = "${aws_subnet.subnet_2_private_cislave.id}"
  route_table_id = "${aws_route_table.private_rt.id}"
}

################################################################################
## private spare subnets & associations
################################################################################

resource "aws_subnet" "subnet_1_private_spare" {
  vpc_id                  = "${aws_vpc.vpc.id}"
  map_public_ip_on_launch = false
  cidr_block              = "${var.cidrs["spare_az1"]}"
  availability_zone       = "${data.aws_availability_zones.available.names[0]}"

  tags {
    Name = "${var.cidrs["spare_az1_name"]}"
  }
}

resource "aws_subnet" "subnet_2_private_spare" {
  vpc_id                  = "${aws_vpc.vpc.id}"
  map_public_ip_on_launch = false
  cidr_block              = "${var.cidrs["spare_az2"]}"
  availability_zone       = "${data.aws_availability_zones.available.names[1]}"

  tags {
    Name = "${var.cidrs["spare_az2_name"]}"
  }
}

resource "aws_route_table_association" "private_assoc_spare_sub_1" {
  subnet_id      = "${aws_subnet.subnet_1_private_spare.id}"
  route_table_id = "${aws_route_table.private_rt.id}"
}

resource "aws_route_table_association" "private_assoc_spare_sub_2" {
  subnet_id      = "${aws_subnet.subnet_1_private_spare.id}"
  route_table_id = "${aws_route_table.private_rt.id}"
}
