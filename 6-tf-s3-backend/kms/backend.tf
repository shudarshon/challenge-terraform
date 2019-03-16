provider "aws" {
  region  = "${var.aws_region}"
}

################################################################################
## Terraform Remote Backend
################################################################################

terraform {
  backend "s3" {
    bucket = "webapp-terraform-state"
    key    = "kms/kms.tfstate"
    region = "us-east-1"
    encrypt = true
  }
}
