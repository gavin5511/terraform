terraform {
  required_version = ">=1.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~>3.0"
    }
  }
  cloud {
    organization = "gavin-medlin"
    workspaces {
      name = "ACI"
    }
  }
}
provider "azurerm" {
  features {}
}