terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
	databricks = {
      source = "databricks/databricks"
    }
  }
  backend "azurerm" {
	resource_group_name  = var.resourcegroup_name
	storage_account_name = "${var.accountname}${random_string.storage_account_name.result}"
	container_name = azurerm_storage_container.containers["phoenix"]
	key = "terraform.tfstate"
	}
}

provider "azurerm" {
  features {}
}
