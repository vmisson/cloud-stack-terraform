terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "2.46.1"
    }
  }
  backend "azurerm" {
    resource_group_name   = "rg-terraform-neu-001"
    storage_account_name  = "saterraform001"
    container_name        = "tstate"
    key                   = "network.tfstate"
  }
}

provider "azurerm" {
  # Configuration options
  features {}
}