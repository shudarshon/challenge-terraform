# port number from DNS is exluded

output "endpoint" {
  value = "${element(split(":", aws_db_instance.RDSWebApp.endpoint), 0)}"
}
