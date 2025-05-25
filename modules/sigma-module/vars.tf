variable "default-region" {
  type = string
  default = "westus2"
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
  }))
  default = [ {
    name = "sigma-test-kv1"
    sku = "standard"
  },{
    name = "sigma-test-kv2"
    sku = "standard"
  }]
}

variable "kv-tenant-id" {
  type = string
}