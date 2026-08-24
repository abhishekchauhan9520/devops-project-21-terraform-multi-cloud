variable "ami" { type = string }
variable "instance_type" { type = string default = "t3.micro" }
variable "name" { type = string default = "aws-demo-vm" }
variable "vpc_id" { type = string }
variable "subnet_id" { type = string }
variable "allowed_ssh_cidr" {
  type = string
  description = "CIDR allowed to SSH to the instance"
  validation {
    condition = can(cidrhost(var.allowed_ssh_cidr, 0))
    error_message = "allowed_ssh_cidr must be a valid CIDR block."
  }
}
variable "user_data" { type = string default = "" }
