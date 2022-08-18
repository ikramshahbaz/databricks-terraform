
module "databricks" {
	source = "./module/databricks"
	resourcegroup_name  			= var.resourcegroup_name
	network_name        			= var.network_name
	tags 							= var.tags
	address_space                   = var.address_space
	location                        = var.location
	default_subnet_name				= var.default_subnet_name
	default_subnet_address          = var.default_subnet_address
	databricks_subnet_name          = var.databricks_subnet_name
	databricks_subnet_address       = var.databricks_subnet_address
	accountname                     = var.accountname
	storage_config 					= var.storage_config
	containers 						= var.containers
	databricks_name                 = var.databricks_name
	clustername                     = var.clustername
}
