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
}

variable "nsg-sr-protocol" {
  description = "ALLOWED VALUES = [Tcp, Udp]"
  type = string
}

variable "nsg-sr-port-ip-settings" {
  description = "e.g()"
  type = string
}