resource "azurerm_resource_group" "tera-rg" {
  name     = "tera-rg"
  location = "Australia East"
}
module "network_module" {
   source = "./modules/network"   
   location= azurerm_resource_group.tera-rg.location
   rg_name= azurerm_resource_group.tera-rg.name
}

module "compute_module" {
   source = "./modules/compute"   
   location= azurerm_resource_group.tera-rg.location
   rg_name= azurerm_resource_group.tera-rg.name
   bastion_subnet_id= module.network_module.subnet-id
   private_subnet_id= module.network_module.private_subnet_id
   vm_password=var.vm_password
   vm_user=var.vm_user

}
module "security_module" {
   source = "./modules/security"   
   location= azurerm_resource_group.tera-rg.location
   rg_name= azurerm_resource_group.tera-rg.name
   private_subnet_id= module.network_module.private_subnet_id
}
