resource "azurerm_resource_group" "rg" {
  name = var.name
  location = var.location
}
resource "azurerm_network_interface" "nic" {
  name = "nic-${var.name}"
  location = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  ip_configuration {
    name = "internal"
    subnet_id = var.subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}
resource "azurerm_linux_virtual_machine" "vm" {
  name = var.name
  resource_group_name = azurerm_resource_group.rg.name
  location = azurerm_resource_group.rg.location
  size = var.size
  admin_username = var.admin_username
  disable_password_authentication = true
  network_interface_ids = [azurerm_network_interface.nic.id]
  admin_ssh_key { username = var.admin_username; public_key = var.ssh_public_key }
  os_disk { caching = "ReadWrite"; storage_account_type = "Standard_LRS" }
  source_image_reference { publisher = "Canonical"; offer = "0001-com-ubuntu-server-jammy"; sku = "22_04-lts-gen2"; version = "latest" }
}
output "vm_id" { value = azurerm_linux_virtual_machine.vm.id }
output "private_ip" { value = azurerm_network_interface.nic.private_ip_address }
