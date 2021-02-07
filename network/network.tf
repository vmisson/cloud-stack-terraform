resource "azurerm_virtual_network" "network-vnet" {
  name                = format("vnet-stack-%s-%s", lookup(var.dc, var.location), var.id)
  tags                = var.tags
  address_space       = ["192.168.0.0/24"]
  location            = azurerm_resource_group.network-rg.location
  resource_group_name = azurerm_resource_group.network-rg.name
}

resource "azurerm_subnet" "network-snet" {
  name                 = format("snet-stack-%s-%s", lookup(var.dc, var.location), var.id)
  resource_group_name  = azurerm_resource_group.network-rg.name
  virtual_network_name = azurerm_virtual_network.network-vnet.name
  address_prefixes     = ["192.168.0.0/25"]
}