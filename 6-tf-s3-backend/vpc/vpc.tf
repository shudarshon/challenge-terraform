################################################################################
## vpc
################################################################################

resource "aws_vpc" "vpc" {
  cidr_block           = "${var.vpc_cidr}"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags {
    Name = "${var.vpc_name}"
  }
}

################################################################################
## internet gateway
################################################################################

resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = "${aws_vpc.vpc.id}"

  tags {
    Name = "${var.vpc_name}"
  }
}

################################################################################
## nat gateway elastic ip
################################################################################

resource "aws_eip" "nat_eip" {
  vpc      = true
  depends_on = ["aws_internet_gateway.internet_gateway"]
}

################################################################################
## nat gateway
################################################################################

resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = "${aws_eip.nat_eip.id}"
  subnet_id     = "${aws_subnet.subnet_1_public.id}"

  tags = {
    Name = "${var.vpc_name}"
  }
  depends_on = ["aws_internet_gateway.internet_gateway"]
}

################################################################################
## public route tables
################################################################################

resource "aws_route_table" "public_rt" {
  vpc_id = "${aws_vpc.vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.internet_gateway.id}"
  }

  tags {
    Name = "${var.public_rt_name}"
  }
}

################################################################################
## private route tables
################################################################################

resource "aws_route_table" "private_rt" {
  vpc_id = "${aws_vpc.vpc.id}"

  tags {
    Name = "${var.private_rt_name}"
  }
}
