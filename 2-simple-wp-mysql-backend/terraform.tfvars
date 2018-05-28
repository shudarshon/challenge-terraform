aws_profile		         = "myprofile"
aws_region 		         = "us-east-1"

rds_identifier         = "tf-test-db"
db_instance_type       = "db.t2.medium"
dbname 			           = "testdb"
dbuser 			           = "test"
dbpassword 		         = "testpass"
db_engine              = "mysql"
db_version             = "5.6.27"
db_storage             = 10
rds_subnet_group_name  = "rds-subnet"

instance_name          = "dev-instance"
instance_type          = "t2.medium"
instance_count         = 1
ami_id 		             = "ami-14c5486b"
dev_host_label         = "dev"

localip                = "x.x.x.x/32"
ssh_user_name          = "ec2-user"
ssh_key_name 		       = "id_rsa"
ssh_key_path           = "/home/chaks/.ssh/id_rsa"
public_key_path 	     = "/home/chaks/.ssh/id_rsa.pub"

vpc_cidr               = "10.1.0.0/16"
public_subnet_cidr     = "10.1.1.0/24"
private1_subnet_cidr   = "10.1.2.0/24"
private2_subnet_cidr   = "10.1.3.0/24"
rds1_subnet            = "10.1.4.0/24"
rds2_subnet            = "10.1.5.0/24"
rds3_subnet            = "10.1.6.0/24"
