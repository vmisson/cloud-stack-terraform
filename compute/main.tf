# Create a resource group
resource "azurerm_resource_group" "compute-rg" {
  name     = format("rg-compute-%s-%s", lookup(var.dc, var.location), var.id)
  tags     = var.tags
  location = var.location
}