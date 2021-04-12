resource "random_password" "db_password" {
  length = 16
}

locals {
  db_admin_username = "pgadmin"
  db_admin_password = random_password.db_password.result
}

resource "azurerm_postgresql_server" "app" {
  location = var.location
  name = "exemplar-${var.environment}-db-server"
  resource_group_name = var.resource_group_name
  sku_name = "B_Gen5_2"
  storage_mb = 307200
  version = "11"
  ssl_enforcement_enabled = true
  ssl_minimal_tls_version_enforced = "TLS1_2"
  administrator_login = local.db_admin_username
  administrator_login_password = local.db_admin_password
}

resource "azurerm_postgresql_database" "app" {
  charset = "UTF8"
  collation = "English_United States.1252"
  name = "exemplar-${var.environment}-db"
  resource_group_name = var.resource_group_name
  server_name = azurerm_postgresql_server.app.name
}

resource "azurerm_postgresql_firewall_rule" "allow_bp_office" {
  name = "AllowBPOffice"
  resource_group_name = var.resource_group_name
  server_name = azurerm_postgresql_server.app.name
  start_ip_address = "81.138.27.254"
  end_ip_address = "81.138.27.254"
}

resource "azurerm_postgresql_firewall_rule" "allow_azure_services" {
  name = "AllowAzureServices"
  resource_group_name = var.resource_group_name
  server_name = azurerm_postgresql_server.app.name
  start_ip_address = "0.0.0.0"
  end_ip_address = "0.0.0.0"
}