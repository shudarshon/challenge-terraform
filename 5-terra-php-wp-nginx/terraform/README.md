# About

  This repository will allow you to use ansible playbook paired with terraform. Terraform will provision cloud resources with ansible dependencies. When instances are ready then ansible will perform configuration management on them.

# How To Use

* You can also use aws profile if you have multiple aws account. Use `aws configure --profile testprofile`. Make sure that awscli is already setup.

* Export your aws access key id and secret access key as following,
  `export AWS_ACCESS_KEY_ID="anaccesskey"
   export AWS_SECRET_ACCESS_KEY="asecretkey"`

* Make sure ansible, terraform is installed and ansible is configured to bypass known_host_check.

* Use `terraform init` to install aws plugin.

* Next, invoke `terraform plan` command to see the possible changes.

* Finally, use `terraform apply` command to perform infrastructure orchestration.

* Use `terraform destroy` to revoke changes.

* Make sure that you always put `*.tfvars` file in .gitignore.

* Optionally, use `terraform graph | dot -Tsvg > graph.svg` command to draw graph of target system.
