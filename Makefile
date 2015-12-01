.PHONY: vm library ansible role pyrax racksapce
SHELL = /bin/bash
TOP := $(dir $(lastword $(MAKEFILE_LIST)))

ANSIBLE_OPTIONS =

clean:
	rm -rf venv

venv:
	test -d venv || virtualenv venv

aws_credential_setup:
	if [ ! -f host_vars/aws_credentials.yml ]; then \
	  cp host_vars/aws_credentials.sample host_vars/aws_credentials.yml; \
	fi;

ansible: venv aws_credential_setup
	venv/bin/pip install -r requirements.txt
	if [ ! -d roles/savagegus.consul ]; then \
		venv/bin/ansible-galaxy install -p roles savagegus.consul; \
	fi;

run_ansible: ansible
	ANSIBLE_HOST_KEY_CHECKING=False \
	ANSIBLE_HOSTS=`pwd`/inventory/ec2.py \
	EC2_INI_PATH=`pwd`/inventory/ec2.ini \
	venv/bin/ansible-playbook -i inventory/ec2.py playbook.yml
