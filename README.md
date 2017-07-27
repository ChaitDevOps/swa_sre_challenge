Tools Used: AWS EC2, Terraform, Ansible and Shell script

Step by step execution:
1. Run terraform apply to generate AWS Ec2 instance with t2.micro
2. Userdata initiates the install.sh which installs Ansible,downloads playbooks from s3 and executes the apache_install_playbook.yml
3. Apache is installed, Started 
5. ssl_module is installed
6. Creates an openssl self signed key and certificate
7. Ansible task to copy index.html to http document root which displays SRE_CHALLENGE.
7. httpd.conf is updated to listen at port 443 and redirect http to https.
8. Automated test to verify that the port is listening at 443 is included in Ansible playbook.
9. Step by step execution is captured in install.log for reference purposes.
