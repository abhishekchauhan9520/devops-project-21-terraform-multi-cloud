terraform {
  required_providers { aws = { source = "hashicorp/aws", version = "6.60.0" } }
}
provider "aws" { region = var.region }
data "aws_vpc" "default" { default = true }
data "aws_subnets" "default" {
  filter { name = "vpc-id"; values = [data.aws_vpc.default.id] }
}
module "aws_vm" {
  source = "../../modules/aws"
  ami = var.ami
  name = var.name
  vpc_id = data.aws_vpc.default.id
  subnet_id = data.aws_subnets.default.ids[0]
  instance_type = var.instance_type
  allowed_ssh_cidr = var.allowed_ssh_cidr
}
output "instance_id" { value = module.aws_vm.instance_id }
output "public_ip" { value = module.aws_vm.public_ip }
