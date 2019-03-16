# about

we have isolated terraform configuration of AWS resources for webapp application into following groups by specific service,

* KMS
* VPC
* Security Group
* RDS

# usage

to modify individual configurations login to that specific folder (such as vpc, sg, kms or rds) and run

  ```
  make init
  make plan
  make apply
  make destroy
  ```

if you want to apply or destroy everything from the root then simply use

  ```
  make apply
  make destroy
  ```  
