provider "aws" {
  region  = "${var.aws_region}"
}

################################################################################
## Terraform Remote Backend
################################################################################

terraform {
  backend "s3" {
    bucket = "webapp-terraform-state"
    key    = "sg/sg.tfstate"
    region = "us-east-1"
    encrypt = true
  }
}

################################################################################
## Terraform Remote Data Source for VPC
################################################################################

data "terraform_remote_state" "shared_vpc_local" {
  backend = "s3"
  config {
    bucket = "webapp-terraform-state"
    key    = "vpc/vpc.tfstate"
    region = "us-east-1"
  }
}
