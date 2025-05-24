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
  type = string
  validation {
    condition = contains(["Inbound", "Outbound"], var.nsg-sr-direction)
    error_message = "nsg-sr-direction must be one of the following: Inbound Outbound"
  }
}

variable "nsg-sr-protocol" {
  description = "ALLOWED VALUES = [Tcp, Udp]"
  type = string
    validation {
    condition = contains(["Tcp", "Udp"], var.nsg-sr-protocol)
    error_message = "nsg-sr-direction must be one of the following: Tcp Udp"
  }
}

variable "nsg-sr-port-ip-settings" {
  description = "e.g()"
  type = string
}