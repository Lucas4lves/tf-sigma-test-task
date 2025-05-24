variable "default-region" {
  type = string
  default = "Japan West"
}

variable "rg-name" {
  type = string
}

variable "nsg-name" {
  type = string
}

variable "nsg-sr-name" {
  type = string
  description = "A name for the security rule"
}

variable "nsg-sr-protocol" {
  type = string
}

variable "nsg-sr-direction" {
  type = string
}

variable "nsg-sr-port-ip-settings" {
  description = "e.g()"
  type = string
}

variable "user-input-kv-list" {
  type = list(object({
    name = string
    sku = string
    enable_soft_deletion = boolean
    enable_purge_protection = boolean
  }))
  default = [ {
    name = "sigma-test-kv1"
    sku = "Standard"
    enable_soft_deletion = true
    enable_purge_protection = false
  },{
    name = "sigma-test-kv2"
    sku = "Basic"
    enable_soft_deletion = false
    enable_purge_protection = false
  }]
}

variable "kv-tenant-id" {
  type = string
}

/*
    name                       = "test123"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
*/