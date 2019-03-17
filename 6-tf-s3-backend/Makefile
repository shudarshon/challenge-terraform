init:
	make -C kms/ init
	make -C vpc/ init
	make -C sg/ init
	make -C rds/ init


apply-kms:
	make -C kms/ apply
	sleep 3

apply-vpc:
	make -C vpc/ apply
	sleep 3

apply-sg:
	make -C sg/ apply

apply-rds:
	make -C rds/ apply
	sleep 3

apply:
	make apply-kms
	make apply-vpc
	make apply-sg
	make apply-rds

destroy-rds:
	make -C rds/ destroy
	sleep 3

destroy-sg:
	make -C sg/ destroy
	sleep 3

destroy-vpc:
	make -C vpc/ destroy
	sleep 3

destroy-kms:
	make -C kms/ destroy

destroy:
	make destroy-rds
	make destroy-sg
	make destroy-vpc
	make destroy-kms
