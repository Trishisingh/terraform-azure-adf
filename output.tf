output "adf_id" {
  value = azurerm_data_factory.example.0.id
}

output "adf_name" {
  description = "Azure Data Factory Name"
  value       = azurerm_data_factory.example.0.name
}

output "adf_identity" {
  description = "Azure Data Factory Name"
  value       = azurerm_data_factory.example.0.identity[0].principal_id
}
