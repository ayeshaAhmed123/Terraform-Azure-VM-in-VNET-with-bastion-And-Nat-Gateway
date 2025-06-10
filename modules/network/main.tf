resource "azurerm_virtual_network" "test_tera_vnet" {
  name                = "test_tera_vnet"
  address_space       = ["10.0.0.0/16"]
  location            = var.location
  resource_group_name = var.rg_name
}

resource "azurerm_subnet" "AzureBastionSubnet" {
  name                 = "AzureBastionSubnet"
  resource_group_name  = var.rg_name
  virtual_network_name = azurerm_virtual_network.test_tera_vnet.name
  address_prefixes     = ["10.0.1.0/26"]
}
data "azurerm_subnet" "private_subnet" {
  name                 = "private-subnet"
  virtual_network_name = azurerm_virtual_network.test_tera_vnet.name
  resource_group_name  = var.rg_name
}

