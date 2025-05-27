locals {
  user-allowed-nsg-rule-settings = {
    name = var.nsg-sr-name
    protocol = var.nsg-sr-protocol
    direction = var.nsg-sr-direction
    port-ip-settings = split(":", var.nsg-sr-port-ip-settings)
  }
  
  parsed-vnet-address-space = split(",", var.vnet-address-space)
  defaults = {
    region = var.default-region
  }
}

data "azurerm_client_config" "current" {}

resource "azurerm_resource_group" "sigma-rg" {
  name = var.rg-name
  location = local.defaults.region
}

resource "azurerm_virtual_network" "sigma-vnet" {
  name                = var.vnet-name
  location            = azurerm_resource_group.sigma-rg.location
  resource_group_name = azurerm_resource_group.sigma-rg.name
  address_space       = local.parsed-vnet-address-space
}

resource "azurerm_network_security_group" "sigma-nsg" {
  name = var.nsg-name
  location = azurerm_resource_group.sigma-rg.location
  resource_group_name = azurerm_resource_group.sigma-rg.name

  dynamic "security_rule" {
    for_each = local.user-allowed-nsg-rule-settings
    content {
      name = local.user-allowed-nsg-rule-settings["name"]
      protocol = local.user-allowed-nsg-rule-settings["protocol"]
      priority                   = 200
      direction                  = local.user-allowed-nsg-rule-settings["direction"]
      access                     = "Allow"
      source_port_range          = element(local.user-allowed-nsg-rule-settings["port-ip-settings"], 1)
      destination_port_range     = element(local.user-allowed-nsg-rule-settings["port-ip-settings"], 1)
      source_address_prefix      = element(local.user-allowed-nsg-rule-settings["port-ip-settings"], 0)
      destination_address_prefix = "*"
    }
  }
}

resource "azurerm_key_vault" "sigma-test-kvs" {
  count = length(var.user-input-kv-list)
  name = var.user-input-kv-list[count.index].name
  sku_name = var.user-input-kv-list[count.index].sku
  purge_protection_enabled = var.user-input-kv-list[count.index].purge_protection
  tenant_id = data.azurerm_client_config.current.tenant_id
  location = local.defaults.region
  resource_group_name = azurerm_resource_group.sigma-rg.name
}