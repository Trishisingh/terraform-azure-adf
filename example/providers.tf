terraform {
  backend "azurerm" {
    resource_group_name  = "tfstateresourcegroup"
    storage_account_name = "tfstaterishi"
    container_name       = "tfstate"
    key                  = "datafactory.terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}


#### this should be removed from parent module
s
