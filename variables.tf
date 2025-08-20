variable "name"         { description = "Base name for resources"; type = string; default = "devsecops-cicd" }
variable "region"       { description = "AWS region"; type = string; default = "us-east-1" }
variable "vpc_cidr"     { description = "VPC CIDR"; type = string; default = "10.0.0.0/16" }
variable "subnet_cidr"  { description = "Public subnet CIDR"; type = string; default = "10.0.0.0/24" }
variable "instance_type"{ description = "EC2 instance type"; type = string; default = "t3.xlarge" }
variable "key_name"     { description = "Existing EC2 Key Pair name for SSH"; type = string }
variable "root_volume_size" { description = "Root volume size GB"; type = number; default = 30 }
variable "data_volume_size" { description = "Data volume size GB"; type = number; default = 512 }
variable "allowed_cidrs" { description = "CIDRs allowed to access 22/80/443/8080"; type = list(string); default = ["0.0.0.0/0"] }
