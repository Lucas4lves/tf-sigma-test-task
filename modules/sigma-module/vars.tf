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