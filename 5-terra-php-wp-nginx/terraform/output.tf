output "ec2-endpoint" {
  value = "${aws_instance.DevInstanceAWS.*.public_ip}"
}
