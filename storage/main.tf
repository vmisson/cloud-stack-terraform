# Create a resource group
resource "azurerm_resource_group" "storage-rg" {
  name     = format("rg-storage-%s-%s", lookup(var.dc, var.location), var.id)
  tags     = var.tags
  location = var.location
}