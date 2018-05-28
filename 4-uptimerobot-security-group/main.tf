data "http" "uptimerobot_ipv4" {
  url = "https://uptimerobot.com/inc/files/ips/IPv4.txt"
}

data "http" "uptimerobot_ipv6" {
  url = "https://uptimerobot.com/inc/files/ips/IPv6.txt"
}

resource "aws_security_group_rule" "uptimerobot_to_tcp" {
  count             = "${var.enable_tcp ? 1 : 0}"
  type              = "ingress"
  from_port         = "0"
  to_port           = "65535"
  protocol          = "tcp"
  cidr_blocks       = ["${formatlist("%s/32", split("\n", trimspace(replace(data.http.uptimerobot_ipv4.body, "/\\r/", ""))))}"]
  ipv6_cidr_blocks  = ["${formatlist("%s/128", split("\n", trimspace(replace(data.http.uptimerobot_ipv6.body, "/\\r/", ""))))}"]
  security_group_id = "${var.security_group_id}"
}

resource "aws_security_group_rule" "uptimerobot_to_http" {
  count             = "${var.enable_http ? 1 : 0}"
  type              = "ingress"
  from_port         = "80"
  to_port           = "80"
  protocol          = "tcp"
  cidr_blocks       = ["${formatlist("%s/32", split("\n", trimspace(replace(data.http.uptimerobot_ipv4.body, "/\\r/", ""))))}"]
  ipv6_cidr_blocks  = ["${formatlist("%s/128", split("\n", trimspace(replace(data.http.uptimerobot_ipv6.body, "/\\r/", ""))))}"]
  security_group_id = "${var.security_group_id}"
}

resource "aws_security_group_rule" "uptimerobot_to_https" {
  count             = "${var.enable_https ? 1 : 0}"
  type              = "ingress"
  from_port         = "443"
  to_port           = "443"
  protocol          = "tcp"
  cidr_blocks       = ["${formatlist("%s/32", split("\n", trimspace(replace(data.http.uptimerobot_ipv4.body, "/\\r/", ""))))}"]
  ipv6_cidr_blocks  = ["${formatlist("%s/128", split("\n", trimspace(replace(data.http.uptimerobot_ipv6.body, "/\\r/", ""))))}"]
  security_group_id = "${var.security_group_id}"
}
