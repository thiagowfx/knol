TERRAFORM := terraform

all: terraform ansible

ansible:
	ansible-playbook -i inventory.ini playbook.yml

terraform:
	$(TERRAFORM) init
	$(TERRAFORM) plan
	$(TERRAFORM) apply

clean:
	$(TERRAFORM) destroy

.PHONY: all ansible terraform clean
