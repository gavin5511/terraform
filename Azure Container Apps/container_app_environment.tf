resource "azurerm_container_app_environment" "my_first_app" {
  name                       = "cae-${local.stack}"
  location                   = azurerm_resource_group.my_first_app.location
  resource_group_name        = azurerm_resource_group.my_first_app.name
  log_analytics_workspace_id = azurerm_log_analytics_workspace.my_first_app.id

  tags = local.default_tags
}