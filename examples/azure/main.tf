terraform {
  required_providers { azurerm = { source = "hashicorp/azurerm", version = "5.0.1" } }
}
provider "azurerm" { features {}; subscription_id = var.subscription_id; tenant_id = var.tenant_id }
module "azure_vm" {
  source = "../../modules/azure"
  name = var.name
  location = var.location
  subnet_id = var.subnet_id
  size = var.size
  admin_username = var.admin_username
  ssh_public_key = var.ssh_public_key
}
output "vm_id" { value = module.azure_vm.vm_id }
output "private_ip" { value = module.azure_vm.private_ip }
