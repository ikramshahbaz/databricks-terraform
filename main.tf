terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.0.0"
    }
	
	databricks = {
      source = "databricks/databricks"
    }
	
  }
  backend "azurerm" {}
  
}

provider "azurerm" {
  features {}
}

#provider "databricks" {
#  azure_workspace_resource_id = azurerm_databricks_workspace.databricks.id
#}

data "azurerm_client_config" "current_config" {}

resource "random_string" "storage_account_name" {
  length  = 5
  lower   = true
  upper   = false
  numeric = true
  special = false
}


resource "azurerm_resource_group" "resourcegroup" {
  name     = var.resourcegroup_name
  location = var.location
  tags     = var.tags

}

resource "azurerm_resource_group" "resourcegroup1" {
  name     = var.resourcegroup_name1
  location = var.location
  tags     = var.tags

}

#resource "azurerm_virtual_network" "virtualnetwork" {
#  name                = var.network_name
#  resource_group_name = azurerm_resource_group.resourcegroup.name
#  location            = azurerm_resource_group.resourcegroup.location
#  address_space       = var.address_space
#  tags                = var.tags
#}
#
#resource "azurerm_subnet" "default_subnet" {
#  for_each             = var.default_subnet_name_address
#  name				   = each.key
#  resource_group_name  = azurerm_resource_group.resourcegroup.name
#  virtual_network_name = azurerm_virtual_network.virtualnetwork.name
#  address_prefixes     = [each.value]
#}
#
#resource "azurerm_subnet" "internal_subnet" {
#  for_each             = var.subnet_name_address
#  name                 = each.key
#  resource_group_name  = azurerm_resource_group.resourcegroup.name
#  virtual_network_name = azurerm_virtual_network.virtualnetwork.name
#  address_prefixes     = [each.value]
#  depends_on = [ 
#				azurerm_virtual_network.virtualnetwork
#			]
#  delegation {
#      name = "databricks-delegation"
#      service_delegation {
#        name = "Microsoft.Databricks/workspaces"
#        actions = [
#          "Microsoft.Network/virtualNetworks/subnets/join/action",
#          "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action",
#          "Microsoft.Network/virtualNetworks/subnets/unprepareNetworkPolicies/action",
#        ]
#      }
#    }
#}
#
#resource "azurerm_network_security_group" "public_nsg" {
#  name                = "public-nsg"
#  resource_group_name = azurerm_resource_group.resourcegroup.name
#  location            = azurerm_resource_group.resourcegroup.location
#  depends_on = [ 
#				azurerm_virtual_network.virtualnetwork
#			]
#}
#
#resource "azurerm_network_security_group" "private_nsg" {
#  name                = "private-nsg"
#  resource_group_name = azurerm_resource_group.resourcegroup.name
#  location            = azurerm_resource_group.resourcegroup.location
#  depends_on = [ 
#				azurerm_virtual_network.virtualnetwork
#			]
#}
#
#resource "azurerm_subnet_network_security_group_association" "public_nsg_association" {
#  subnet_id                 = azurerm_subnet.internal_subnet["public-subnet"].id
#  network_security_group_id = azurerm_network_security_group.public_nsg.id
#  depends_on = [ 
#				azurerm_subnet.internal_subnet,
#				azurerm_network_security_group.public_nsg
#			]
#}
#
#resource "azurerm_subnet_network_security_group_association" "private_nsg_association" {
#  subnet_id                 = azurerm_subnet.internal_subnet["private-subnet"].id
#  network_security_group_id = azurerm_network_security_group.private_nsg.id
#  depends_on = [ 
#				azurerm_subnet.internal_subnet,
#				azurerm_network_security_group.private_nsg
#			]
#}
#
#resource "azurerm_storage_account" "storage_account" {
#  name                      = "${var.accountname}${random_string.storage_account_name.result}"
#  resource_group_name       = azurerm_resource_group.resourcegroup.name
#  location                  = azurerm_resource_group.resourcegroup.location
#  account_kind              = var.storage_config.account_kind
#  account_tier              = var.storage_config.account_type
#  access_tier               = var.storage_config.access_tier
#  account_replication_type  = var.storage_config.account_replica_type
#  enable_https_traffic_only = true
#  min_tls_version           = "TLS1_2"
#  tags                      = var.tags
#  queue_properties {
#    logging {
#      delete                = true
#      read                  = true
#      write                 = true
#      version               = "1.0"
#      retention_policy_days = 10
#    }
#    hour_metrics {
#      enabled               = true
#      include_apis          = true
#      version               = "1.0"
#      retention_policy_days = 10
#    }
#    minute_metrics {
#      enabled               = true
#      include_apis          = true
#      version               = "1.0"
#      retention_policy_days = 10
#    }
#  }
#  #  lifecycle {
#  #    prevent_destroy = true
#  #  }
#}
#
#resource "azurerm_storage_encryption_scope" "storage_account_encryption" {
#  name               = "microsoftmanaged"
#  storage_account_id = azurerm_storage_account.storage_account.id
#  source             = "Microsoft.Storage"
#    depends_on = [ 
#				azurerm_storage_account.storage_account
#			]
#}
#
#resource "azurerm_storage_container" "containers" {
#  for_each              = var.containers
#  name                  = each.key
#  storage_account_name  = azurerm_storage_account.storage_account.name
#  container_access_type = each.value
#    depends_on = [ 
#				azurerm_storage_account.storage_account
#			]
#  
#}
#
#resource "azurerm_databricks_workspace" "databricks" {
#  name                        = var.databricks_name
#  resource_group_name         = azurerm_resource_group.resourcegroup.name
#  location                    = azurerm_resource_group.resourcegroup.location
#  sku                         = "standard"
#  tags                        = var.tags
#  managed_resource_group_name = "${var.databricks_name}-dependentrg"
#  custom_parameters {
#    no_public_ip             = false
#    storage_account_name     = "${var.databricks_name}dependent${random_string.storage_account_name.result}"
#    storage_account_sku_name = "Standard_GRS"
#    virtual_network_id       = azurerm_virtual_network.virtualnetwork.id
#    public_subnet_name       = azurerm_subnet.internal_subnet["public-subnet"].name
#    private_subnet_name      = azurerm_subnet.internal_subnet["private-subnet"].name
#	public_subnet_network_security_group_association_id  = azurerm_subnet_network_security_group_association.public_nsg_association.id
#    private_subnet_network_security_group_association_id = azurerm_subnet_network_security_group_association.private_nsg_association.id
#  }	
#  depends_on = [
#    azurerm_subnet_network_security_group_association.public_nsg_association,
#    azurerm_subnet_network_security_group_association.private_nsg_association
#  ]
#}
#
#data "databricks_node_type" "smallest" {
#  local_disk = true
#  depends_on = [
#    azurerm_databricks_workspace.databricks
#  ]
#}
#
#data "databricks_spark_version" "latest_lts" {
#  long_term_support = true
#  depends_on = [
#    azurerm_databricks_workspace.databricks
#  ]
#}
#
#resource "databricks_cluster" "shared_autoscaling" {
#  cluster_name            = var.clustername
#  spark_version           = data.databricks_spark_version.latest_lts.id
#  node_type_id            = "Standard_DS3_v2"
#  autotermination_minutes = 20
#  autoscale {
#    min_workers = 1
#    max_workers = 2
#  }
#}
#
#
