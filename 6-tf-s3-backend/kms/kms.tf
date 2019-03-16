################################################################################
## SSM KMS KEY
################################################################################

resource "aws_kms_key" "KMS_SSM" {
  description             = "KMS key for SSM encryption"
  deletion_window_in_days = 14
}

################################################################################
## EBS KMS KEY
################################################################################

resource "aws_kms_key" "KMS_EBS" {
  description             = "KMS key for EBS encryption"
  deletion_window_in_days = 14
}
