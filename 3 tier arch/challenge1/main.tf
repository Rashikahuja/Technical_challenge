#resource group
resource "azurerm_resource_group" "challenge_rg" {
  name     = local.resource_group_name
  location = var.location

     tags = {
    environment = "test"
    name = local.resource_group_name
  }
}

#virtual network
resource "azurerm_virtual_network" "challenge-vnet" {
    name = local.vnet_name
    address_space = ["10.0.0.0/16"]
    location = var.location
    resource_group_name = azurerm_resource_group.challenge_rg.name
}

