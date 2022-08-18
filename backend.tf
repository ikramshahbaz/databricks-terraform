terraform {
backend "azurerm" {
	resource_group_name  = var.resourcegroup_name
	storage_account_name = "${var.accountname}${random_string.storage_account_name.result}"
	container_name = azurerm_storage_container.containers["phoenix"]
	key = "terraform.tfstate"
	}
}
