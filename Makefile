all: terraform ansible

ansible:
	ansible-playbook -i inventory.ini playbook.yml

terraform:
	terraform init
	terraform apply

.PHONY: all ansible terraform
