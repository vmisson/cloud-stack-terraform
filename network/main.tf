# Create a resource group
resource "azurerm_resource_group" "network-rg" {
  name     = format("rg-network-%s-%s", lookup(var.dc, var.location), var.id)
  tags     = var.tags
  location = var.location
}