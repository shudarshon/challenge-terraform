output "kms_ssm_id" {
  value = "${aws_kms_key.KMS_SSM.*.id}"
}

output "kms_ebs_id" {
  value = "${aws_kms_key.KMS_EBS.*.id}"
}
