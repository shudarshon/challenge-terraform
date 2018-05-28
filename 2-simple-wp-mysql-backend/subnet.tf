# Data Source
data "aws_availability_zones" "available" {}

resource "aws_subnet" "public" {
  vpc_id = "${aws_vpc.VPC.id}"
  cidr_block = "${var.public_subnet_cidr}"
  map_public_ip_on_launch = true
  availability_zone = "${data.aws_availability_zones.available.names[0]}"

  tags {
    Name = "public"
  }
}

resource "aws_subnet" "private1" {
  vpc_id = "${aws_vpc.VPC.id}"
  cidr_block = "${var.private1_subnet_cidr}"
  map_public_ip_on_launch = false
  availability_zone = "${data.aws_availability_zones.available.names[1]}"

  tags {
    Name = "private1"
  }
}

resource "aws_subnet" "private2" {
  vpc_id = "${aws_vpc.VPC.id}"
  cidr_block = "${var.private2_subnet_cidr}"
  map_public_ip_on_launch = false
  availability_zone = "${data.aws_availability_zones.available.names[0]}"

  tags {
    Name = "private2"
  }
}

resource "aws_subnet" "rds1" {
  vpc_id = "${aws_vpc.VPC.id}"
  cidr_block = "${var.rds1_subnet}"
  map_public_ip_on_launch = false
  availability_zone = "${data.aws_availability_zones.available.names[0]}"

  tags {
    Name = "rds1"
  }
}

resource "aws_subnet" "rds2" {
  vpc_id = "${aws_vpc.VPC.id}"
  cidr_block = "${var.rds2_subnet}"
  map_public_ip_on_launch = false
  availability_zone = "${data.aws_availability_zones.available.names[1]}"

  tags {
    Name = "rds2"
  }
}

resource "aws_subnet" "rds3" {
  vpc_id = "${aws_vpc.VPC.id}"
  cidr_block = "${var.rds3_subnet}"
  map_public_ip_on_launch = false
  availability_zone = "${data.aws_availability_zones.available.names[2]}"

  tags {
    Name = "rds3"
  }
}

# Subnet Associations

resource "aws_route_table_association" "public_assoc" {
  subnet_id = "${aws_subnet.public.id}"
  route_table_id = "${aws_route_table.public.id}"
}

resource "aws_route_table_association" "private1_assoc" {
  subnet_id = "${aws_subnet.private1.id}"
  route_table_id = "${aws_route_table.private.id}"
}


resource "aws_route_table_association" "private2_assoc" {
  subnet_id = "${aws_subnet.private2.id}"
  route_table_id = "${aws_route_table.private.id}"
}

resource "aws_db_subnet_group" "rds_subnet_group" {
  name = "${var.rds_subnet_group_name}"
  subnet_ids = ["${aws_subnet.rds1.id}", "${aws_subnet.rds2.id}", "${aws_subnet.rds3.id}"]
  tags {
    Name = "rds_subnet_group"
  }
}
