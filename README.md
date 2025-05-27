# Devops Engineer @Sigma Software - Test Task on Terraform

## Authenticating

* Terraform user must be logged into Azure CLI with sufficient permissions to create Network Security Groups and Key Vaults:
```
az login
```

## Using variables
* Make sure to have a local variables file (e.g: env.tfvars) with the following key/value pair: 
```
subscription-id         | string -> required by azurerm provider version 4.30
```
<span style="color:yellow;">WARNING!</span> subscription-id is sensitive data. 

* Required input for this module is: 
```
nsg-sr-direction        | string (Allowed Values: Inbound, Outbound )
nsg-sr-protocol         | string (Allowed Values: Tcp, Udp, Icmp, Esp, Ah or * )
nsg-sr-port-ip-settings | string (e.g: 93.105.70.150/32)
install-sigma-module    | bool
subscription-id         | string
```
## Key Vault creation settings
* This template has a default value set up for creating key vaults.
* Increment or decrement this array to configure how many vaults and which options to have on sku and purge protection fields.
```
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
```
## Module creation "Killing Switch" option
* The variable named install-sigma-module has to be <strong>true</strong> in order to create all resources into sigma-test-module 
```
module "sigma-test-module" {
  count = var.install-sigma-module? 1 : 0

  source                  = "./modules/sigma-module"
  rg-name                 = var.rg-name
  nsg-name                = var.nsg-name
  nsg-sr-direction        = var.nsg-sr-direction
  nsg-sr-name             = var.nsg-name
  nsg-sr-protocol         = var.nsg-sr-protocol
  nsg-sr-port-ip-settings = var.nsg-sr-port-ip-settings
}
```
