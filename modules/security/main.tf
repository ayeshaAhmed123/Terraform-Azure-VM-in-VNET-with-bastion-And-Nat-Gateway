
resource "azurerm_nat_gateway" "nat-tera-gateway" {
  name                    = "nat-gateway"
  location                = var.location
  resource_group_name     = var.rg_name
  sku_name                = "Standard"
  idle_timeout_in_minutes = 10
  zones                   = ["1"]

}
resource "azurerm_subnet_nat_gateway_association" "nat-gateway-association" {
  subnet_id      = var.private_subnet_id
  nat_gateway_id = azurerm_nat_gateway.nat-tera-gateway.id
}
resource "azurerm_public_ip" "gateway_public_ip" {
  name                = "gateway_public_ip"
  location            = var.location
  resource_group_name = var.rg_name
  allocation_method   = "Static"
  sku                 = "Standard"
  zones               = ["1"]  
}
resource "azurerm_nat_gateway_public_ip_association" "pulic-ip-gateway-association" {
  nat_gateway_id       = azurerm_nat_gateway.nat-tera-gateway.id
  public_ip_address_id = azurerm_public_ip.gateway_public_ip.id
}