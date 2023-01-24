provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "RGforstorageaccount" {
  name     = var.azurerm_resource_group
  location = "northcentralus"
}

resource "azurerm_storage_account" "storage-account" {
  name                     = var.storage_account
  resource_group_name      = azurerm_resource_group.RGforstorageaccount.name
  location                 = azurerm_resource_group.RGforstorageaccount.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "staging"
  }
}


resource "azurerm_network_security_group" "sg1" {
  name                = var.sg_name
  location            = azurerm_resource_group.RGforstorageaccount.location
  resource_group_name = azurerm_resource_group.RGforstorageaccount.name
}

resource "azurerm_virtual_network" "virtual-network" {
  name                = var.virtual_network_name
  location            = var.azure_region
  resource_group_name = var.azurerm_resource_group
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]

  subnet {
    name           = "subnet1"
    address_prefix = "10.0.1.0/24"
  }

  subnet {
    name           = "subnet2"
    address_prefix = "10.0.2.0/24"
    security_group = azurerm_network_security_group.sg1.id
  }

  tags = {
    environment = "staging"
  }
}