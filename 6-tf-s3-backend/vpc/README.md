#### Simple VPC Subnet Design ####

vpc=192.168.5.0/24


sub_private_webapp_az1=192.168.5.0/28
sub_private_webapp_az2=192.168.5.64/28

sub_public_az1=192.168.5.128/28
sub_public_az2=192.168.5.160/28

sub_public_rds_az1=192.168.5.192/28
sub_public_rds_az2=192.168.5.208/28

sub_private_cislave_az1=192.168.5.224/28
sub_private_cislave_az2=192.168.5.232/28

sub_private_spare_az1=192.168.5.240/28
sub_private_spare_az2=192.168.5.248/28

```
subnet_name > number_of_usable_hosts X number_of_subnets

webapp > 14 x 2 = 28
public > 14 x 2 = 28
rds > 14 x 2 = 28
ci > 14 x 2 = 28
spare > 14 x 2 = 28

total usable host = num of subnets x usable hosts per subnet = 10 x 14 = 140
unused hosts, 254-140 = 114
```

* Each web app will be holding 14 usable hosts in private subnet with /28 subnet id.
* Each public subnet will be holding 14 usable hosts with /28 subnet id.
* Each rds will be holding 14 usable hosts in private subnet with /28 subnet id.
* Each ci slave will be holding 14 usable hosts in private subnet with /28 subnet id.
* Each spare will be holding 14 usable hosts in private subnet with /28 subnet id.
