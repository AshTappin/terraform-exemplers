terraform {
  backend "remote" {
    organization = "blackpeppersoftware"

    workspaces {
      name = "ash"
    }
  }
}

provider "azurerm" {
  features {}
}

locals {
  location = "UK South"
}

resource "azurerm_resource_group" "ash-exemplar" {
  location = local.location
  name = "ash-exemplar-resource-group"
}