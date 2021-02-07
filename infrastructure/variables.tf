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
    Resource    = "Infrastructure"
    Application = "Stack"
  }
}

data "azurerm_client_config" "current" {}