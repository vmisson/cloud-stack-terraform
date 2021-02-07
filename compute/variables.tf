variable "location" {
    type    = string
    default = "North Europe"
}

variable "dc" {
  default = {
    "North Europe" = "neu"
    "West Europe"  = "weu"
  }
}

variable "id" {
    type    = string
    default = "001"
}

variable "tags" {
  type = map

  default = {
    Environment = "Terraform"
    Resource    = "Compute"
    Application = "Stack"
  }
}

data "azurerm_subnet" "network-snet" {
  name                 = format("snet-stack-%s-%s", lookup(var.dc, var.location), var.id)
  virtual_network_name = format("vnet-stack-%s-%s", lookup(var.dc, var.location), var.id)
  resource_group_name  = format("rg-network-%s-%s", lookup(var.dc, var.location), var.id)
}

data "azurerm_managed_disk" "data-disk" {
  name                = format("data-%s-%s", lookup(var.dc, var.location), var.id)
  resource_group_name = format("rg-storage-%s-%s", lookup(var.dc, var.location), var.id)
}