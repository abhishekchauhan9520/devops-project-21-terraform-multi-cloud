variable "region" { type = string default = "us-east-1" }
variable "ami" { type = string description = "AMI ID valid in the selected region" }
variable "instance_type" { type = string default = "t3.micro" }
variable "name" { type = string default = "aws-multicloud-demo" }
variable "allowed_ssh_cidr" { type = string description = "Your public IP/CIDR, e.g. 203.0.113.10/32" }
