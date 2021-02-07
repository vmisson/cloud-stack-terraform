resource "azurerm_network_security_group" "nsg-cloudstack" {
  name                = "nsg-cloudstack"
  location            = azurerm_resource_group.compute-rg.location
  resource_group_name = azurerm_resource_group.compute-rg.name
}

resource "azurerm_network_interface_security_group_association" "association-nsg-cloudstack" {
  network_interface_id      = azurerm_network_interface.nic-cloudstack.id
  network_security_group_id = azurerm_network_security_group.nsg-cloudstack.id
}

resource "azurerm_network_security_rule" "nsg-cloudstack-IN-TCP-22" {
  name                        = "IN-TCP-22"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "TCP"
  source_address_prefix       = "*"
  source_port_range           = "*"
  destination_address_prefix  = "*"
  destination_port_range      = "22"
  resource_group_name         = azurerm_resource_group.compute-rg.name
  network_security_group_name = azurerm_network_security_group.nsg-cloudstack.name
}

resource "azurerm_network_security_rule" "nsg-cloudstack-IN-TCP-443" {
  name                        = "IN-TCP-443"
  priority                    = 200
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "TCP"
  source_address_prefix       = "*"
  source_port_range           = "*"
  destination_address_prefix  = "*"
  destination_port_range      = "443"
  resource_group_name         = azurerm_resource_group.compute-rg.name
  network_security_group_name = azurerm_network_security_group.nsg-cloudstack.name
}

resource "azurerm_network_security_rule" "nsg-cloudstack-IN-TCP-25" {
  name                        = "IN-TCP-25"
  priority                    = 300
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "TCP"
  source_address_prefix       = "*"
  source_port_range           = "*"
  destination_address_prefix  = "*"
  destination_port_range      = "25"
  resource_group_name         = azurerm_resource_group.compute-rg.name
  network_security_group_name = azurerm_network_security_group.nsg-cloudstack.name
}

resource "azurerm_network_security_rule" "nsg-cloudstack-IN-TCP-143" {
  name                        = "IN-TCP-143"
  priority                    = 305
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "TCP"
  source_address_prefix       = "*"
  source_port_range           = "*"
  destination_address_prefix  = "*"
  destination_port_range      = "143"
  resource_group_name         = azurerm_resource_group.compute-rg.name
  network_security_group_name = azurerm_network_security_group.nsg-cloudstack.name
}

resource "azurerm_network_security_rule" "nsg-cloudstack-IN-TCP-587" {
  name                        = "IN-TCP-587"
  priority                    = 310
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "TCP"
  source_address_prefix       = "*"
  source_port_range           = "*"
  destination_address_prefix  = "*"
  destination_port_range      = "587"
  resource_group_name         = azurerm_resource_group.compute-rg.name
  network_security_group_name = azurerm_network_security_group.nsg-cloudstack.name
}

resource "azurerm_network_security_rule" "nsg-cloudstack-IN-TCP-993" {
  name                        = "IN-TCP-993"
  priority                    = 315
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "TCP"
  source_address_prefix       = "*"
  source_port_range           = "*"
  destination_address_prefix  = "*"
  destination_port_range      = "993"
  resource_group_name         = azurerm_resource_group.compute-rg.name
  network_security_group_name = azurerm_network_security_group.nsg-cloudstack.name
}