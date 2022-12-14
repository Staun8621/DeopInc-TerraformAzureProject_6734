# resource "azurerm_resource_group" "terraform_sample" {
#     name     = "terraform-sample"
#     location = "${var.arm_region}"
# }

# create a virtual network
resource "azurerm_virtual_network" "my_vn" {
  name                = "tf-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = "${var.arm_region}"
  resource_group_name = "${var.arm_resource_group_name}"
}

# create a subnet frontend
resource "azurerm_subnet" "my_subnet_frontend" {
  name                 = "frontend"
  resource_group_name  = "${var.arm_resource_group_name}"
  virtual_network_name = "${azurerm_virtual_network.my_vn.name}"
  address_prefixes      = ["10.0.1.0/24"]
}

# create a subnet backend
resource "azurerm_subnet" "my_subnet_backend" {
  name                 = "backend"
  resource_group_name  = "${var.arm_resource_group_name}"
  virtual_network_name = "${azurerm_virtual_network.my_vn.name}"
  address_prefixes      = ["10.0.2.0/24"]
}

# create a subnet dmz
resource "azurerm_subnet" "my_subnet_dmz" {
  name                 = "dmz"
  resource_group_name  = "${var.arm_resource_group_name}"
  virtual_network_name = "${azurerm_virtual_network.my_vn.name}"
  address_prefixes      = ["10.0.3.0/24"]
}
