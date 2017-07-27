# Variables for AWS Sign in - will feed in from Jenkins or through CLI
variable "aws_access_key" {}
variable "aws_secret_key" {}

variable "asg_max_size" {
  default = "1"
}

variable "asg_min_size" {
  default = "1"
}

variable "elb_name" {
  default = "elb name"
}

variable "elb_dns" {
  default = "elb dns name"
}


variable "subnet_id" {
  default = "xxxx"
}


variable "availability_zone" {
  default = "us-east-1b"
}


variable "asg_desired_size" {
  default = "1"
}

variable "aws_region" {
  default = "us-east-1"
}

variable "app_name" {
  default="swa_sre_challenge"
}

variable "aws_key_name" {
  default = "sre_challenge_keypair"
}

variable "ami_id" {
  default = "ami-xxxxx"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "iam_instance_profile" {
  default = " "
}

variable "start_stop" {
  default = "yes"
}

variable "firstRun" {
  default = "yes"
}
variable "security_group" {
  default = "xxx,xxx,xxx"
}

variable "root_volume_size" {
  default = "50"
}

variable "root_iops" {
  default = "1500"
}

variable "node_type" {
  default = "XXXX"
}

variable "ad_group" {
  default = "xxxx"
}

variable "application" {
  default = "XXXX"
}

variable "application_asv" {
  default = "XXXXX"
}

variable "owner_contact" {
  default = "XXXX"
}
variable "owner_id" {
  default = "xxxx"
}

variable "maid_downtime" {
  default = "Offhours tz=ET"
}
variable "downtime" {
  default = "weekend"
}

variable "CMDBEnvironment" {
  default = "xxxx"
}

variable "cdh_version" {
  default = "5.5.1"
}
variable "os_version" {
  default = "6"
}


variable "service_acct_usr" {
  default = "xxxx"
}
variable "service_acct_pass" {
  default = "xxx"
}
