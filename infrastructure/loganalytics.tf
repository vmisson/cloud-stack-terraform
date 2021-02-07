resource "azurerm_log_analytics_workspace" "log-analytics-workspace" {
  name                = format("log-stack-%s-%s", lookup(var.dc, var.location), var.id)
  tags                = var.tags
  location            = azurerm_resource_group.infrastructure-rg.location
  resource_group_name = azurerm_resource_group.infrastructure-rg.name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}