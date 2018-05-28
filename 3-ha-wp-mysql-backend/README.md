# How To Use

* You can also use aws profile if you have multiple aws account. Use `aws configure --profile testprofile`. Make sure that awscli is already setup.

* Export your aws access key id and secret access key as following,
  `export AWS_ACCESS_KEY_ID="anaccesskey"
   export AWS_SECRET_ACCESS_KEY="asecretkey"`

* Make sure terraform is installed.

* Use `terraform init` to install aws plugin.

* Additionally, you can rename `route53.tf.bkp` file to `route53.tf` to automate the change in DNS and hosting zone.

* Next, invoke `terraform plan` command to see the possible changes.

* Finally, use `terraform apply` command to perform infrastructure orchestration.

* Use `terraform destroy` to revoke changes.

* Make sure that you always put `*.tfvars` file in .gitignore.
