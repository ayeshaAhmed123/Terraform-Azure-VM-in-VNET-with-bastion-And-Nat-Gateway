resource "azurerm_public_ip" "bastion_public_ip" {
  name                = "bastion_public_ip"
  location            = var.location
  resource_group_name = var.rg_name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_bastion_host" "bastion_for_privatesubnet" {
  name                = "bastion_vnet_testing_privatesubnet"
  location            = var.location
  resource_group_name = var.rg_name
  ip_configuration {
    name                 = "public_ip_config"
    subnet_id            = var.bastion_subnet_id
    public_ip_address_id = azurerm_public_ip.bastion_public_ip.id
  }
}

resource "azurerm_network_interface" "nic_window_vm" {
  name                = "nic_window_vm"
  location            = var.location
  resource_group_name = var.rg_name

  ip_configuration {
    name                          = "nic_window_vm_private_ip"
    subnet_id                     = var.private_subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}
resource "azurerm_windows_virtual_machine" "private-vm" {
  name                = "private-vm"
  resource_group_name = var.rg_name
  location            = var.location
  size                = "Standard_D2s_v3"
  admin_username      = var.vm_user
  admin_password      = var.vm_password
  network_interface_ids = [
    azurerm_network_interface.nic_window_vm.id,
  ]
  patch_mode = "AutomaticByPlatform"
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "StandardSSD_LRS"
    disk_size_gb = 127
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2022-datacenter-azure-edition-hotpatch"
    version   = "latest"
  }
}