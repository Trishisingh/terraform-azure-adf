############################################
# NAMING
############################################

variable "name_company" {
  description = "Company Name - should/will be used in conventional resource naming"
  type        = string
  default = "ris"
}

variable "name_project" {
  description = "Project Name - should/will be used in conventional resource naming"
  type        = string
  default = "dev"
}

variable "name_component" {
  description = "Component Name - should/will be used in conventional resource naming. Typically this will be a logical name for this part of the system i.e. `API` || `middleware` or more generic like `Billing`"
  type        = string
  default = "adf"
}

variable "name_environment" {
  type = string
  default = "dev"
}

variable "stage" {
  type    = string
  default = "dev"
}

variable "attributes" {
  description = "Additional attributes for tagging"
  default     = []
}

variable "tags" {
  description = "Tags to be assigned to all resources, NB if global tagging is enabled these will get overwritten periodically"
  type        = map(string)
  default     = {}
}


variable "resource_group_location" {
  type    = string
  default = "uksouth"
}


# Each region must have corresponding a shortend name for resource naming purposes 
variable "location_name_map" {
  type = map(string)

  default = {
    northeurope   = "eun"
    westeurope    = "euw"
    uksouth       = "uks"
    ukwest        = "ukw"
    eastus        = "use"
    eastus2       = "use2"
    westus        = "usw"
    eastasia      = "ase"
    southeastasia = "asse"
  }
}

variable "git_integration" {
  type        = string
  default     = "github"
  description = "A repositry integration block for ADF integration, can be from null, github or vsts ?"
  validation {
    condition     = can(regex("^null$|^github$|^vsts$", var.git_integration))
    error_message = "Err: integration value is not valid  it can be from null, github, vsts."
  }
}

variable "root_folder" {
  type        = string
  default     = "/adf_managed"
  description = "Specifies the root folder within the repository. Set to / for the top level."
}

variable "public_network_enabled" {
  type        = bool
  default     = true
  description = "Is the Data Factory visible to the public network? Defaults to true"
}

variable "managed_virtual_network_enabled" {
  type        = bool
  default     = false
  description = "Is Managed Virtual Network enabled?"
}

variable "adf_managed-vnet-runtime_name" {
  type        = string
  default     = "adf-managed-vnet-runtime"
  description = "Specifies the name of the Managed Integration Runtime. Changing this forces a new resource to be created. Must be globally unique. See the Microsoft documentation for all restrictions."
}

variable "runtime_virtual_network_enabled" {
  type        = bool
  default     = true
  description = "Is Integration Runtime compute provisioned within Managed Virtual Network? Changing this forces a new resource to be created."
}


variable "repository_name" {
  type        = string
  default     = "test"
  description = "Specifies the name of the git repository."
}
