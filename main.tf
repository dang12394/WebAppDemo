resource "azurerm_resource_group" "swa" {
  name = "swa-demo"
  location = "southeastasia"
}
resource "azurerm_mssql_server" "swa_db_server" {
  name = "dang12394-db"
  resource_group_name = azurerm_resource_group.swa.name
  location = azurerm_resource_group.swa.location
  version = "12.0"
  administrator_login = "azuredb"
  administrator_login_password = var.DB_pwd
  minimum_tls_version = "1.2"
}

resource "azurerm_mssql_database" "swa_db" {
  name = "books"
  server_id = azurerm_mssql_server.swa_db_server.id
  collation = "SQL_Latin1_General_CP1_CI_AS"
  sku_name = "GP_S_Gen5_2"
  storage_account_type = "Local"
}

resource "azurerm_mssql_firewall_rule" "swa_db" {
    name = "DBRule1"
    server_id = azurerm_mssql_server.swa_db_server.id
    start_ip_address = "0.0.0.0"
    end_ip_address = "0.0.0.0"
}

resource "azurerm_static_web_app" "swa" {
  name = "SWA-Demo"
  resource_group_name = azurerm_resource_group.swa.name
  location = azurerm_resource_group.swa.location
}