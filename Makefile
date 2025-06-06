# Makefile at infra-toolbox/ level

ANSIBLE=ansible-playbook -i ansible/inventory/inventory.ini

.PHONY: bootstrap docker nvidia nctk lockdown ping full-stack

bootstrap:
	ANSIBLE_HOST_KEY_CHECKING=False \
	$(ANSIBLE) ansible/playbooks/ssh-bootstrap.yml --ask-pass -K

docker:
	$(ANSIBLE) ansible/playbooks/install-docker.yml

nvidia:
	$(ANSIBLE) ansible/playbooks/install-nvidia-drivers.yml

nctk:
	$(ANSIBLE) ansible/playbooks/install-nctk.yml

lockdown:
	$(ANSIBLE) ansible/playbooks/lockdown.yml

ping:
	ansible -i ansible/inventory/inventory.ini all -m ping

full-stack: bootstrap docker nvidia nctk lockdown
	@echo "✅ Full stack completed across oven nodes."
