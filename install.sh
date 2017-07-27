#!/bin/bash

cd /tmp

# install ansible software
wget "https://XXXX/ansible/1.9.4+20151105023931/ansible-1.9.4+20151105023931-el6.rpm" -O ansible.rpm
rpm -ivh ansible.rpm > install.log

# download playbooks
aws s3 cp --sse AES256 s3://xxxx/apache_install_playbook.yml .
aws s3 cp --sse AES256 s3://xxxx/apache_restart.yml .

# download index.html file
aws s3 cp --sse AES256 s3://xxxx/index.html .

echo 'Ansible playbooks downloaded' >> install.log

# Running Ansible playbook to install Apache and configure
/opt/ansible/bin/ansible-playbook apache_install_playbook.yml -i "localhost," -e "OS_VERSION=${os_version} CDH_VERSION=${cdh_version} service_acct_usr=${service_acct_usr}" --connection local  >> install.log
