# Configure the Azure provider
terraform {
  required_version = ">= 1.1.0"
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }
  cloud {
    organization = "gavin-medlin"
    workspaces {
      name = "learn-azure"
    }
  }  
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg-uks" {
  name     = var.resource_group_name_uks
  location = "uksouth"
  tags = {
    environment = "Production"
    location = "UKS"
  }
}

resource "azurerm_resource_group" "rg-ukw" {
  name     = var.resource_group_name_ukw
  location = "ukwest"
  tags = {
    environment = "Production"
    location = "UKW"
  }
}

resource "azurerm_resource_group" "rg-eun" {
  name     = var.resource_group_name_eun
  location = "northeurope"
  tags = {
    environment = "Production"
    location = "EUN"
  }
}

resource "azurerm_resource_group" "rg-euw" {
  name     = var.resource_group_name_euw
  location = "westeurope"
  tags = {
    environment = "Production"
    location = "EUW"
  }
}

# Create Azure virtual networks
resource "azurerm_virtual_network" "vnet-uks" {
  name                = "vnet-uks"
  address_space       = ["10.1.0.0/16"]
  location            = azurerm_resource_group.rg-uks.location
  resource_group_name = azurerm_resource_group.rg-uks.name
}

resource "azurerm_subnet" "vnet-uks-sn1" {
  name                 = "VM-Subnet-1"
  resource_group_name  = azurerm_resource_group.rg-uks.name
  virtual_network_name = azurerm_virtual_network.vnet-uks.name
  address_prefixes     = ["10.1.0.0/24"]
}

resource "azurerm_virtual_network" "vnet-ukw" {
  name                = "vnet-uks"
  address_space       = ["10.2.0.0/16"]
  location            = azurerm_resource_group.rg-ukw.location
  resource_group_name = azurerm_resource_group.rg-ukw.name
}

resource "azurerm_subnet" "vnet-ukw-sn1" {
  name                 = "VM-Subnet-1"
  resource_group_name  = azurerm_resource_group.rg-ukw.name
  virtual_network_name = azurerm_virtual_network.vnet-ukw.name
  address_prefixes     = ["10.2.0.0/24"]
}

# Create peerings between the 2 subnets
resource "azurerm_virtual_network_peering" "uks-ukw" {
  name                      = "peer-uks-ukw"
  resource_group_name       = azurerm_resource_group.rg-uks.name
  virtual_network_name      = azurerm_virtual_network.vnet-uks.name
  remote_virtual_network_id = azurerm_virtual_network.vnet-ukw.id
}

resource "azurerm_virtual_network_peering" "ukw-uks" {
  name                      = "peer-ukw-uks"
  resource_group_name       = azurerm_resource_group.rg-ukw.name
  virtual_network_name      = azurerm_virtual_network.vnet-ukw.name
  remote_virtual_network_id = azurerm_virtual_network.vnet-uks.id
}

# More to be added soon