resource "azurerm_managed_disk" "storage-disk" {
  name                    = format("data-%s-%s", lookup(var.dc, var.location), var.id)
  tags                    = var.tags
  location                = azurerm_resource_group.storage-rg.location
  resource_group_name     = azurerm_resource_group.storage-rg.name

  storage_account_type    = "StandardSSD_LRS"
  create_option           = "Empty"
  disk_size_gb            = "32"
}