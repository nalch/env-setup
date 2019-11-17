# env-setup
Ansible environment setup scripts

## Prepare Ansible and Git
```shell
curl -fsSL https://raw.githubusercontent.com/nalch/env-setup/master/shell-prep.sh | sudo /bin/sh
```


## Run Playbook - ansible-pull
```shell
ansible-pull -U https://github.com/nalch/env-setup.git -K -d /tmp/.nalchinstall -i inventory-local -e "username=<username>" playbooks/setup.yml
```

## Tags
* directories
* repos
* packages
* snap
* python
* ssh
* shell
* config
* playerctl
* fonts
* i3config
* i3blocks