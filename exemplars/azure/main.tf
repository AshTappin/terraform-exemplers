terraform {
  backend "remote" {
    organization = "blackpeppersoftware"
    workspaces {
      prefix = "exemplar-"
    }
  }
}

provider "azurerm" {
  features {}
}

locals {
  location = "UK South"
  environment = terraform.workspace
}

resource "azurerm_resource_group" "ash-exemplar" {
  location = local.location
  name = "exemplar-${local.environment}-resource-group"
}

module "server" {
  source = "./modules/server"
  environment = local.environment
  ip_restrictions = []
  location = local.location
  resource_group = azurerm_resource_group.ash-exemplar.name
}

