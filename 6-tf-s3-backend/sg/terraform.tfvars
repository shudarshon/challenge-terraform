aws_region = "us-east-1"

service_cidr = [

  "104.192.136.0/21",
  "13.52.5.0/25",
  "18.205.93.0/25",
  "18.234.32.128/25",
  "34.198.203.127/32",
  "34.198.32.85/32"
]

user_cidr = [

  "45.124.168.22/32"

]

user_sg_name = "User_SG"
service_webhook_sg_name = "Service_Webhook_SG"
webserver_sg_name = "WebServer_SG"
rds_mysql_sg_name = "RDS_MySQL_SG"
rds_psql_sg_name = "RDS_PgSQL_SG"
local_vpc_http_sg_name = "Local_VPC_HTTP(S)_SG"
