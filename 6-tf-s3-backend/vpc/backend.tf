provider "aws" {
  region  = "${var.aws_region}"
}

data "aws_availability_zones" "available" {}

################################################################################
## Terraform Remote Backend
################################################################################

terraform {
  backend "s3" {
    bucket = "webapp-terraform-state"
    key    = "vpc/vpc.tfstate"
    region = "us-east-1"
    encrypt = true
  }
}
