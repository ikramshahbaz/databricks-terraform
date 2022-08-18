terraform {
backend "azurerm" {
	resource_group_name  = "New_RG"
	storage_account_name = "phoenixteam7892"
	container_name = "phoenix"
	key = "terraform.tfstate"
	}
}
