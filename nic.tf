resource "azurerm_network_interface" "TerraformNIC" {
  name                = var.nicname
  location            = var.location
  resource_group_name = azurerm_resource_group.Terraform.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.TerraformSubnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.example.id
  }

  tags = var.tags
}

resource "azurerm_network_interface_security_group_association" "example" {
  network_interface_id      = azurerm_network_interface.TerraformNIC.id
  network_security_group_id = azurerm_network_security_group.TerraformNSG.id
}