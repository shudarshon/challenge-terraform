aws_region             = "us-east-1"

identifier             = "webapp-stage-rds-mysql-5-7-23"
dbname 			       = "webapp_stage_db"
dbuser 			       = "webapp_user"
dbpassword 		       = "webapp_password"

db_engine              = "mysql"
db_version             = "5.7.23"
db_instance_type       = "db.t2.micro"
allocated_storage      = 5

ssm_user_name_var      = "WEBAPP_STAGE_RDS_USER_NAME"
ssm_db_name_var        = "WEBAPP_STAGE_RDS_DB_NAME"
ssm_db_password_var    = "WEBAPP_STAGE_RDS_DB_PASSWORD"
ssm_db_endpoint_var    = "WEBAPP_STAGE_RDS_DB_ENDPOINT"
