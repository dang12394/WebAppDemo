output "swa" {
  value = azurerm_static_web_app.swa.api_key
  sensitive = true
}

output db_string {
  sensitive = true
  value       = "Server=tcp:${azurerm_mssql_server.swa_db_server.fully_qualified_domain_name},1433;Initial Catalog=${azurerm_mssql_database.swa_db.name};Persist Security Info=False;User ID=${azurerm_mssql_server.swa_db_server.administrator_login};Password=${azurerm_mssql_server.swa_db_server.administrator_login_password};MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"
}