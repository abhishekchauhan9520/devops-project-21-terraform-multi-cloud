variable "subscription_id" { type = string sensitive = true }
variable "tenant_id" { type = string sensitive = true }
variable "name" { type = string default = "azure-multicloud-demo" }
variable "location" { type = string default = "eastus" }
variable "subnet_id" { type = string description = "Existing subnet resource ID" }
variable "size" { type = string default = "Standard_B1s" }
variable "admin_username" { type = string default = "azureadmin" }
variable "ssh_public_key" { type = string sensitive = true description = "OpenSSH public key" }
