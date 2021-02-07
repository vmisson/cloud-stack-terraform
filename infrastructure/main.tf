# Create a resource group
resource "azurerm_resource_group" "infrastructure-rg" {
  name     = format("rg-infrastructure-%s-%s", lookup(var.dc, var.location), var.id)
  tags     = var.tags
  location = var.location
}