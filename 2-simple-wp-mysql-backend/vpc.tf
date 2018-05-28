# VPC
resource "aws_vpc" "VPC" {
  cidr_block = "${var.vpc_cidr}"
}

#internet gateway

resource "aws_internet_gateway" "IGW" {
  vpc_id = "${aws_vpc.VPC.id}"
}

# Route tables

resource "aws_route_table" "public" {
  vpc_id = "${aws_vpc.VPC.id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.IGW.id}"
  }
  tags {
    Name = "public"
  }
}

resource "aws_route_table" "private" {
  vpc_id = "${aws_vpc.VPC.id}"
  tags {
    Name = "private"
  }
}

resource "aws_default_route_table" "default" {
  default_route_table_id = "${aws_vpc.VPC.default_route_table_id}"
  tags {
    Name = "default"
  }
}
