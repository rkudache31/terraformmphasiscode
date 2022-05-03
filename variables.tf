
variable "client_id" {
  type        = string
  description = "The Client ID which should be used. This can also be sourced from the ARM_CLIENT_ID Environment Variable. "
}

variable "client_secret" {
  type        = string
  description = "The Client secrete "
}

variable "subscription_id" {
  type        = string
  description = " The Subscription ID which should be used. This can also be sourced from the ARM_SUBSCRIPTION_ID Environment Variable. "
  
}

variable "tenant_id" {
  type        = string
  description = " The Subscription ID which should be used. This can also be sourced from the ARM_SUBSCRIPTION_ID Environment Variable. "
  
}



variable "resource_group_name" {
  type        = string
  description = "resource group name "
}

variable "name" {
  type        = string
  description = "VM Name. "
}




variable "size" {
  type        = string
  description = " The SKU which should be used for this Virtual Machine, such as Standard_F2. "
}

variable "admin_username" {
  type        = string
  description = "admin_username"
}

variable "tag_primary" {
type = string
description = "ProjectCode-77231 ProjectName-CloudTest PrimaryOwner-Testuser1 SecondaryOwner-TestUser2"

}

variable "tag_Pcode" {
type = string
description = "ProjectCode-77231 ProjectName-CloudTest PrimaryOwner-Testuser1 SecondaryOwner-TestUser2"
}
variable "tag_PName" {
type = string
description = "ProjectName-CloudTest PrimaryOwner-Testuser1 SecondaryOwner-TestUser2"
}
variable "tag_Secondary" {
type = string
description = "ProjectCode-77231 ProjectName-CloudTest PrimaryOwner-Testuser1 SecondaryOwner-TestUser2"
}


variable "id" {
  type        = string
  description = "A list of Network Interface ID's which should be attached to this Virtual Machine. The first Network Interface ID in this list will be the Primary Network Interface on the Virtual Machine"
}


variable "public_key_path" {
  type        = string
  description = "pem file path  "
}

variable "disable_password_authentication" {
type        = string
  description = "disable_password_authentication true or false   "
}


variable "admin_password" {
  type        = string
  description = "Admin Password"
}

variable "caching" {
  type        = string
  description = "Type of Caching which should be used for the Internal OS Disk. Possible values are None, ReadOnly and ReadWrite "
}

variable "storage_account_type" {
  type        = string
  description = "The Type of Storage Account which should back this the Internal OS Disk. Possible values are Standard_LRS, StandardSSD_LRS and Premium_LRS. Changing this forces a new resource to be created."
}

variable "publisher" {
  type        = string
  description = " Specifies the publisher of the image used to create the virtual machines."
}

variable "offer" {
  type        = string
  description = " Specifies the offer of the image used to create the virtual machines"
  
}

variable "sku" {
  type        = string
  description = " Specifies the offer of the image used to create the virtual machines"
  
}

variable "version_name" {
  type        = string
  description = " Specifies the version of the image used to create the virtual machines."
  
}

variable "NIname" {
  type        = string
  description = " Network interface name "
  
}

variable "InternalName" {
  type        = string
  description = " Internal Name Internal or external "
  
}

variable "location" {
  type        = string
  description = " The Azure location where the Linux Virtual Machine should exist. Changing this forces a new resource to be created "
  
}





variable "subnet_id" {
type        = string
  description = " subnet id. "
  
}

variable "private_ip_address_allocation" {
type        = string
  description = " private ip address allocation . "
  
}

