aws_region="us-east-1"

vpc_cidr="192.168.5.0/24"
vpc_name="webapp_stage_vpc"

public_rt_name="webapp_stage_publicrt"
private_rt_name="webapp_stage_publicrt"

rds_subnetgroup_name="webapp-stage"

cidrs={

  webapp_az1="192.168.5.0/28"
  webapp_az1_name="webapp_stage_private_webapp_az1"

  webapp_az2="192.168.5.16/28"
  webapp_az2_name="webapp_stage_private_webapp_az2"

  public_az1="192.168.5.32/28"
  public_az1_name="webapp_stage_public_az1"

  public_az2="192.168.5.48/28"
  public_az2_name="webapp_stage_public_az2"

  rds_az1="192.168.5.64/28"
  rds_az1_name="webapp_stage_public_rds_az1"

  rds_az2="192.168.5.80/28"
  rds_az2_name="webapp_stage_public_rds_az2"

  cislave_az1="192.168.5.96/28"
  cislave_az1_name="webapp_stage_private_cislave_az1"

  cislave_az2="192.168.5.112/28"
  cislave_az2_name="webapp_stage_private_cislave_az2"

  spare_az1="192.168.5.128/28"
  spare_az1_name="webapp_stage_private_spare_az1"

  spare_az2="192.168.5.144/28"
  spare_az2_name="webapp_stage_private_spare_az2"
}
