variable "azure_region" {
  default = "northcentralus"
}

variable "storage_account_group" {
  default = "storage_account_group"
  type    = string
}

variable "storage_account" {
  default = "cwtstorage"
  type    = string
}


variable "sg_name" {
  default = "sg_vnet"
  type    = string
}


variable "virtual_network_name" {
  default = "cwtvnet"
  type    = string
}

variable "azurerm_resource_group" {
  default   = "cwtresourceGroup"
  type     = string
}