#Web subnet
resource "azurerm_subnet" "web-subnet" {
  name = local.subnet-web
  resource_group_name = azurerm_resource_group.challenge_rg.name
  virtual_network_name = azurerm_virtual_network.challenge-vnet.name
  address_prefixes = [ "10.1.2.0/24" ]
}

#web NIC
resource "azurerm_network_interface" "webserv-nic" {
  name = local.nic-web
  location = var.location
  resource_group_name = azurerm_resource_group.challenge_rg.name

ip_configuration{

  name = "web-configuration"
  subnet_id = azurerm_subnet.web-subnet.id
  private_ip_address_allocation = "dynamic"

}
}

#Webserver
resource "azurerm_virtual_machine" "webserv" {
  name = local.web-vm
  location = var.location
  resource_group_name = azurerm_resource_group.challenge_rg.name
  network_interface_ids = [azurerm_network_interface.webserv-nic.id]
  vm_size = "Standard_B1s"

storage_image_reference {

    publisher = "MicrosoftWindowsServer"
    offer = "WindowsServer"
    sku = "2022-datacenter-azure-edition"
    version = "latest"
}


storage_os_disk {
    name              = local.storage_os_disk_web
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

   os_profile {
    computer_name  = "${local.web-vm}-hostname"
    admin_username = "admin-web"
    admin_password = "Welcome@2023"
  }

  os_profile_windows_config{
  provision_vm_agent = true
  enable_automatic_upgrades = true
}

 tags = {
    environment = "test"
  }

}