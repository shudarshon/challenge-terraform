# usage

The data is used to allow access from those ips to your origin on port 80 or 443 using a boolean var to apply the rule. Initially all tcp ports have been allowed to make uptimerobot check service status for custom port. Security group id is required to function terraform for adding rules. Switch off the variable values to make terraform take proper action. Use following commands to apply terraform configuration.

```shell
$ terraform init
$ terraform plan
$ terraform apply
```
# credit

This repository was cloned from [https://github.com/sysadmiral/terraform-aws-secgrouprule-uptimerobot](here). I just did some custom implementations.
