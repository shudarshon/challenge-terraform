# About

The data is used to allow access from those ips to your origin on port 80 or 443 using a boolean var to apply the rule. Initially all TCP ports have been allowed to make uptimerobot check service status for custom port. Security group id is required to function terraform for adding rules.

# Usage

* Create empty security groups in AWS and gather the security group IDs.
* Change variable values in tfvars file to true/false accordingly.
* Map security group ID against specific protocol to allow from UptimeRobot.

Next, apply following commands to make changes

```shell
$ terraform init
$ terraform plan
$ terraform apply
```

# Credit

This repository was cloned from [https://github.com/sysadmiral/terraform-aws-secgrouprule-uptimerobot](here). I just did some custom implementations.
