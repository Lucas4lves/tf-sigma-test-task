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
  description = "e.g()"
  type        = string
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
    sku = "standard"
    enable_soft_deletion = true
    enable_purge_protection = false
  },{
    name = "sigma-test-kv2"
    sku = "standard"
    enable_soft_deletion = false
    enable_purge_protection = false
  }]
}

variable "kv-tenant-id" {
  type = string
}