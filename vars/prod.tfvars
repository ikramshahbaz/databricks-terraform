#resourcegroup_name = "New_RG"
network_name       = "Prod-Vent"
location                        = "centralindia"
location1                        = "centralindia"
tags = {
  Product     = "Name",
  Application = "App",
  Owner       = "Email"
}
#resourcegroup_name1 = "New_RG"

address_space                   = ["280.0.0.0/16"]

default_subnet_name				= ["defaut"]
default_subnet_address          = ["10.0.0.0/24"]
databricks_subnet_name          = ["public-subnet","private-subnet"]
databricks_subnet_address       = ["10.0.1.0/24","10.0.2.0/24"]
accountname                     = "phoenixprod"
storage_config = { 
	account_kind 		 = "StorageV2",
	account_type         = "Standard",
	access_tier          = "Hot",
	account_replica_type = "RAGRS"
}
containers = { 
	"phoenix" 			= "private",
	"artifact" 			= "blob"
}
databricks_name                 = "databricks"
clustername                     = "testcluster"






