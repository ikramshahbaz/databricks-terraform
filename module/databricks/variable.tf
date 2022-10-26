variable "resourcegroup_name" {
  description = "Name of the resource group"
  type        = string
}

variable "resourcegroup_name1" {
  description = "Name of the resource group"
  type        = string
}

variable "tags" {
  type        = map(string)
  description = "Tags for the resources"
}

variable "location" {
  description = "Region where resources will be deployed"
  type        = string
  default     = "centralindia"
}

variable "location1" {
  description = "Region where resources will be deployed"
  type        = string
  default     = "centralindia"
}


variable "network_name" {
  description = "Name of the virtual network"
  type        = string
}

variable "address_space" {
  type        = list(string)
  description = "The address space that is used by the virtual network."
}
/*
variable "default_subnet_name" {
  type = list(string)
  description = "Name of the default subnet"
}

variable "default_subnet_address" {
  type = list(string)
  description = "Address for default subnet"
}

variable "databricks_subnet_name" {
  type = list(string)
  description = "Name of the databricks managed subnet name"
}

variable "databricks_subnet_address" {
  type = list(string)
  description = "Name of the databricks managed subnet"
}

variable "accountname" {
  type = string
}

variable "storage_config" {
  type = object({
    account_kind         = string
    account_type         = string
    access_tier          = string
    account_replica_type = string
  })
}

variable "containers" {
  type = map(any)
}

variable "databricks_name" {
  type = string
}

variable "clustername" {
  type = string
}

*/
