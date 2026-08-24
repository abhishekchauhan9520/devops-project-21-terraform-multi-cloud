variable "name" { type = string default = "azure-demo-vm" }
variable "location" { type = string default = "eastus" }
variable "subnet_id" { type = string }
variable "size" { type = string default = "Standard_B1s" }
variable "admin_username" { type = string default = "azureadmin" }
variable "ssh_public_key" { type = string description = "OpenSSH public key used by the VM" }
