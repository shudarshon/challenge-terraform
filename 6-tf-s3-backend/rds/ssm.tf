################################################################################
## RDS secrets as SSM Configuration
################################################################################

resource "aws_ssm_parameter" "User_Name" {
  name  = "${var.ssm_user_name_var}"
  type  = "SecureString"
  overwrite = true
  key_id = "${data.terraform_remote_state.shared_kms_local.kms_ssm_id[0]}"
  value = "${var.dbuser}"
}

resource "aws_ssm_parameter" "DB_Name" {
  name  = "${var.ssm_db_name_var}"
  type  = "SecureString"
  overwrite = true
  key_id = "${data.terraform_remote_state.shared_kms_local.kms_ssm_id[0]}"
  value = "${var.dbname}"
}

resource "aws_ssm_parameter" "DB_Password" {
  name  = "${var.ssm_db_password_var}"
  type  = "SecureString"
  overwrite = true
  key_id = "${data.terraform_remote_state.shared_kms_local.kms_ssm_id[0]}"
  value = "${var.dbpassword}"
}

resource "aws_ssm_parameter" "DB_Endpoint" {
  name  = "${var.ssm_db_endpoint_var}"
  type  = "SecureString"
  key_id = "${data.terraform_remote_state.shared_kms_local.kms_ssm_id[0]}"
  overwrite = true
  value = "${element(split(":", aws_db_instance.RDSWebApp.endpoint), 0)}"
}
