
# enable global peering between the two virtual network
resource "azurerm_virtual_network_peering" "peering" {
  count                        = var.enabled_peering ? 1 : 0
  name                         = format("%s-peering-%s", var.vnet_1_name, var.vnet_2_name)
  resource_group_name          = var.resource_group_1_name
  virtual_network_name         = var.vnet_1_name
  remote_virtual_network_id    = var.vnet_2_id
  allow_virtual_network_access = var.allow_virtual_network_access
  allow_forwarded_traffic      = var.allow_forwarded_traffic_vnet1
  allow_gateway_transit        = var.allow_gateway_transit_vnet1
  use_remote_gateways          = var.use_remote_gateways_vnet1
}


# enable global peering between the two virtual network
resource "azurerm_virtual_network_peering" "peering_back" {
  count                        = var.enabled_peering ? 1 : 0
  name                         = format("%s-peering-%s", var.vnet_2_name, var.vnet_1_name)
  resource_group_name          = var.different_rg ? var.resource_group_2_name : var.resource_group_1_name
  virtual_network_name         = var.vnet_2_name
  remote_virtual_network_id    = var.vnet_1_id
  allow_virtual_network_access = var.allow_virtual_network_access
  allow_forwarded_traffic      = var.allow_forwarded_traffic_vnet2
  allow_gateway_transit        = var.allow_gateway_transit_vnet2
  use_remote_gateways          = var.use_remote_gateways_vnet2
}
