resource "azurerm_app_service_plan" "app" {
  location = var.location
  name = "exemplar-${var.environment}-service-plan"
  resource_group_name = var.resource_group
  sku {
    size = "F1"
    tier = "Free"
  }
  kind = "Linux"
  reserved = true
}

resource "azurerm_app_service" "app" {
  app_service_plan_id = azurerm_app_service_plan.app.id
  location = var.location
  name = "exemplar-${var.environment}-app-service"
  resource_group_name = var.resource_group

  site_config {
    always_on = true
    dynamic "ip_restriction" {
      for_each = var.ip_restrictions
      content {
        ip_address = ip_restriction.value.ip_address
        name = ip_restriction.value.name
      }
    }
  }
}