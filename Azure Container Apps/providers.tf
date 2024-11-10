terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.52.0"
    }
  }
  cloud {
    organization = "gavin-medlin"
    workspaces {
      name = "ACA"
    }
  }
}

provider "azurerm" {
  features {}
}