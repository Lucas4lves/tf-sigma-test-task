module "sigma-test-module" {
  count = var.install-sigma-module? 1 : 0

  source                  = "./modules/sigma-module"
  rg-name                 = var.rg-name
  nsg-name                = var.nsg-name
  nsg-sr-direction        = var.nsg-sr-direction
  nsg-sr-name             = var.nsg-name
  nsg-sr-protocol         = var.nsg-sr-protocol
  nsg-sr-port-ip-settings = var.nsg-sr-port-ip-settings
  vnet-address-space = var.vnet-address-space 
}