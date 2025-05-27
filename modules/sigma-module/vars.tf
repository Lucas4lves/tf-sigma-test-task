variable "default-region" {
  type = string
  default = "westus2"
}

variable "rg-name" {
  type = string
}

variable "vnet-name" {
  type = string
  default = "sigma-test-vnet"
}

variable "vnet-address-space" {
  type = string
  description = "Comma separared list of IP ranges for vnet resource address space: e.g: 10.0.0.0/16,10.12.124.0/32"
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
    sku  = string
    purge_protection = bool
  }))
  default = [{
    name = "sigma-test-kv1"
    sku  = "standard"
    purge_protection = false
    }, {
    name = "sigma-test-kv2"
    sku  = "standard"
    purge_protection = false
  },
  {
    name = "sigma-test-kv3"
    sku  = "premium"
    purge_protection = true
  }]
}