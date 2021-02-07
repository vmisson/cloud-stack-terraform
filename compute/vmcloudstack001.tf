resource "azurerm_public_ip" "pip-cloudstack" {
  name                = "pip-01-vmcloudstack001"
  tags                = var.tags
  location            = azurerm_resource_group.compute-rg.location
  resource_group_name = azurerm_resource_group.compute-rg.name
  domain_name_label   = "vmcloudstack001"
  allocation_method   = "Static"
}

resource "azurerm_network_interface" "nic-cloudstack" {
  name                = "nic-01-vmcloudstack001"
  tags                = var.tags
  location            = azurerm_resource_group.compute-rg.location
  resource_group_name = azurerm_resource_group.compute-rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.network-snet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.pip-cloudstack.id
  }
}

resource "azurerm_linux_virtual_machine" "vmcloudstack" {
  name                = "vmcloudstack001"
  tags                = var.tags
  location            = azurerm_resource_group.compute-rg.location
  resource_group_name = azurerm_resource_group.compute-rg.name
  size                = "Standard_B2s"
  admin_username      = "vincent"
  network_interface_ids = [
    azurerm_network_interface.nic-cloudstack.id,
  ]

  custom_data         = filebase64("cloud-init.yaml")

  admin_ssh_key {
    username   = "vincent"
    public_key = file("~/.ssh/id_rsa.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
    name                 = "osd-vmcloudstack001"
  }

  source_image_reference {
    publisher = "canonical"
    offer     = "0001-com-ubuntu-server-groovy"
    sku       = "20_10"
    version   = "latest"
  }
}

resource "azurerm_virtual_machine_data_disk_attachment" "attachment-data" {
  managed_disk_id    = data.azurerm_managed_disk.data-disk.id
  virtual_machine_id = azurerm_linux_virtual_machine.vmcloudstack.id
  lun                = "0"
  caching            = "ReadWrite"
}