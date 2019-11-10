# env-setup
Ansible environment setup scripts

## Prepare Ansible and Git
curl -fsSL https://raw.githubusercontent.com/nalch/env-setup/master/shell-prep.sh | sudo /bin/sh

## Run Playbook - ansible-pull
ansible-pull -U https://github.com/nalch/env-setup.git -K -d /tmp/.nalchinstall -i inventory-local -e "username=<username>" playbooks/setup.yml