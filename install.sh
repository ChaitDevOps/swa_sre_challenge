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

cur_hostname=`ifconfig | grep "inet " | grep -Fv 127.0.0.1 | awk '{print $2}'`
echo "Hostname: $cur_hostname" >> install.log

echo "  " >> /etc/httpd/conf/httpd.conf
echo "LoadModule ssl_module modules/mod_ssl.so" >> /etc/httpd/conf/httpd.conf
echo "Listen 443" >> /etc/httpd/conf/httpd.conf

echo "  " >> /etc/httpd/conf/httpd.conf
echo "<VirtualHost *:80>
        Redirect permanent / https://$cur_hostname:443
      </VirtualHost>" >> /etc/httpd/conf/httpd.conf
echo "  " >> /etc/httpd/conf/httpd.conf

echo "<VirtualHost *:443>
        ServerName $cur_hostname
        SSLEngine on
        SSLCertificateFile /etc/httpd/ssl/myserver.crt
        SSLCertificateKeyFile /etc/httpd/ssl/myserver.key
      </VirtualHost>" >> /etc/httpd/conf/httpd.conf

# service httpd restart

# Apache restart and automated test run
/opt/ansible/bin/ansible-playbook apache_restart.yml -i "localhost," -e "OS_VERSION=${os_version} CDH_VERSION=${cdh_version} service_acct_usr=${service_acct_usr}" --connection local  >> install.log

echo "Apache restarted" >> install.log
