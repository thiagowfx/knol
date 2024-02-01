TERRAFORM := terraform

all: terraform ansible

ansible:
	ansible-playbook -i inventory.ini playbook.yml

terraform:
	$(TERRAFORM) init
	$(TERRAFORM) plan
	$(TERRAFORM) apply

.PHONY: all ansible terraform
