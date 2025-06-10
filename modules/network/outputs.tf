output "vnet-id"{
    value= azurerm_virtual_network.test_tera_vnet.id
}
output "subnet-id"{
    value= azurerm_subnet.AzureBastionSubnet.id
}
output "private_subnet_id" {
  value = data.azurerm_subnet.private_subnet.id
}