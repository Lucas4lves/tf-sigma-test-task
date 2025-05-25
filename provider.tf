terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=4.30.0"
    }
  }
}

provider "azurerm" {
  features {
      key_vault {
      purge_soft_delete_on_destroy    = true
    }
  }
  subscription_id = var.subscription-id
}