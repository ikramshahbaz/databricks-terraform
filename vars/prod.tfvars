resourcegroup_name = "New_RG"
network_name       = "Prod-Vent"
tags = {
  Product     = "Name",
  Application = "App",
  Owner       = "Email"
}
address_space                = ["10.0.0.0/16"]
location                     = "centralindia"
default_subnet_name_address = { "default" = "10.0.0.0/24"
}
subnet_name_address = {  "public-subnet" = "10.0.1.0/24",
						 "private-subnet" = "10.0.2.0/24"
}
accountname                  = "phoenixprod"
storage_config = { account_kind = "StorageV2",
  account_type         = "Standard",
  access_tier          = "Hot",
  account_replica_type = "RAGRS"
}
containers = { "phoenix" = "private",
  "artifact" = "blob"
}
databricks_name = "databricks"
clustername = "testcluster"






