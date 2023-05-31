data "azurerm_client_config" "current" {}

module "default_label" {
  source     = "git::https://github.com/cloudposse/terraform-null-label.git?ref=0.25.0"
  namespace  = "${var.name_company}-${var.name_project}"
  stage      = var.stage
  name       = "${lookup(var.location_name_map, var.resource_group_location, "uksouth")}-${var.name_component}"
  attributes = var.attributes
  delimiter  = "-"
  tags       = var.tags
}

##################################################
# ResourceGroups
##################################################

resource "azurerm_resource_group" "default" {
  name     = module.default_label.id
  location = var.resource_group_location
  tags     = var.tags
}

module "adf" {
  source                          = "git::https://github.com/Trishisingh/terraform-azure-datafactory/?ref=master"
  resource_namer                  = module.default_label.id
  resource_group_name             = azurerm_resource_group.default.name
  resource_group_location         = azurerm_resource_group.default.location
  git_integration                 = var.git_integration
  resource_tags                   = module.default_label.tags
  repository_name                 = var.repository_name
  root_folder                     = var.root_folder
  managed_virtual_network_enabled = var.managed_virtual_network_enabled
}
