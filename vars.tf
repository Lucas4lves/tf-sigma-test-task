variable "default-region" {
  type    = string
  default = "westus2"
}

variable "rg-name" {
  type = string
  default = "sample-rg"
}

variable "nsg-name" {
  type = string
  default = "sample-nsg"
}

variable "nsg-sr-name" {
  type = string
  default = "sample-nsg-sr"
}

variable "nsg-sr-direction" {
  description = "ALLOWED VALUES = [Inbound, Outbound]"
  type        = string
  validation {
    condition     = contains(["Inbound", "Outbound"], var.nsg-sr-direction)
    error_message = "nsg-sr-direction must be one of the following: Inbound Outbound"
  }
}

variable "nsg-sr-protocol" {
  description = "ALLOWED VALUES = [Tcp, Udp]"
  type        = string
  validation {
    condition     = contains(["Tcp", "Udp"], var.nsg-sr-protocol)
    error_message = "nsg-sr-direction must be one of the following: Tcp Udp"
  }
}

variable "nsg-sr-port-ip-settings" {
  description = "e.g: 93.105.70.150/32:443"
  type        = string
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
  }]
}

variable "subscription-id" {
  type = string
  default = ""
}

variable "install-sigma-module" {
  type = bool
}