terraform {

  // THe state can also be sstored in an S3 bucket or azure storage
  // container. As long as it is secure and encrypted in rest and transit.
  // This is because the state can contain sensitive data such as passwords and
  // private keys
  //  https://www.terraform.io/docs/language/state/sensitive-data.html
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

module "postgresql" {
  source = "./modules/postgresql-database"
  environment = local.environment
  location = local.location
  resource_group_name = azurerm_resource_group.ash-exemplar.name
}

