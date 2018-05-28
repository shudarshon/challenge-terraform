#Security groups

resource "aws_security_group" "public" {
  name = "AllowSshHttpSG"
  description = "Used for public and private instances for load balancer access"
  vpc_id = "${aws_vpc.VPC.id}"

  #SSH

  ingress {
    from_port   = 22
    to_port   = 22
    protocol  = "tcp"
    cidr_blocks = ["${var.localip}"]
  }

  #HTTP

  ingress {
    from_port   = 80
    to_port   = 80
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  #Outbound internet access

  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

#Private Security Group

resource "aws_security_group" "private" {
  name        = "VPCTrafficAllowSG"
  description = "Used for private instances"
  vpc_id      = "${aws_vpc.VPC.id}"


  # Access from other security groups

  ingress {
    from_port    = 0
    to_port      = 0
    protocol     = "-1"
    cidr_blocks  = ["${var.vpc_cidr}"]
  }

  egress {
    from_port    = 0
    to_port      = 0
    protocol     = "-1"
    cidr_blocks  = ["0.0.0.0/0"]
  }
}

#RDS Security Group

resource "aws_security_group" "RDS" {
  name= "MySqlAllowSG"
  description = "Used for DB instances"
  vpc_id      = "${aws_vpc.VPC.id}"

  # SQL access from public/private security group

  ingress {
    from_port        = 3306
    to_port          = 3306
    protocol         = "tcp"
    security_groups  = ["${aws_security_group.public.id}","${aws_security_group.private.id}"]
  }
}
