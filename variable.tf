#Initial Configurations
variable "region" {
  default = "us-west-1"
}

variable "access_key" {}

variable "secret_key" {}

variable "vpc_cidr_block" {
  default = "10.0.0.0/16"
}

variable "vpc_tenancy" {
  default = "default"
}

variable "az" {
  type    = list(string)
  default = ["us-west-1b", "us-west-1c"]
}

#Subnets
variable "pub_subnet_cidr" {
  type    = list(string)
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "priv-web-sub-cidr" {
  type    = list(string)
  default = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "priv-intlb-sub-cidr" {
  type    = list(string)
  default = ["10.0.5.0/24", "10.0.6.0/24"]
}

variable "priv-app-sub-cidr" {
  type    = list(string)
  default = ["10.0.7.0/24", "10.0.8.0/24"]
}

variable "priv-db-sub-cidr" {
  type    = list(string)
  default = ["10.0.9.0/24", "10.0.10.0/24"]
}

#Instance
variable "bastion-host-instance-type" {
  default = "t2.micro"
}

variable "web-server-instance-type" {
  default = "t2.micro"
}

variable "app-server-instance-type" {
  default = "t2.micro"
}

variable "key-pair-path" {
  default = "ec2sshkey.pub"
}

variable "sg-ports" {
  type    = list(string)
  default = ["22", "80", "8080", "443"]
}

variable "WEB-Server-user-data-path" {
  default = "web_userdata.sh"
}

variable "APP-Server-user-data-path" {
  default = "app_userdata.sh"
}

variable "s3-lb-log-policy-path" {
  default = "s3_lb_log_policy.txt"
}

variable "app-iam-role-path" {
  default = "app_iam_role.txt"
}

variable "app-iam-role-policy-path" {
  default = "app_iam_role_policy.txt"
}
