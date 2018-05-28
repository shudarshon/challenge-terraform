aws_profile		              = "superhero"
aws_region		              = "us-east-1"

vpc_cidr                    = "10.0.0.0/16"
cidrs			                  = {
  public1  = "10.0.1.0/24"
  public2  = "10.0.2.0/24"
  private1 = "10.0.3.0/24"
  private2 = "10.0.4.0/24"
  rds1	   = "10.0.5.0/24"
  rds2     = "10.0.6.0/24"
  rds3     = "10.0.7.0/24"
}

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

localip                = "103.216.59.97/32"
ssh_user_name          = "ec2-user"
ssh_key_name 		       = "id_rsa"
ssh_key_path           = "/home/chaks/.ssh/id_rsa"
public_key_path 	     = "/home/chaks/.ssh/id_rsa.pub"

domain_name		= "devopslab"

elb_healthy_threshold   = "2"
elb_unhealthy_threshold = "2"
elb_timeout 		= "3"
elb_interval		= "30"

asg_max 		= "2"
asg_min			= "1"
asg_grace		= "300"
asg_hct			= "EC2"
asg_cap			= "2"
asg_instance_type	= "t2.medium"
delegation_set 		= "N1HDAZB52OQ3IV"
test = {}
