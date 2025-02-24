variable "resource_group_name" {
    type    = string
    default = "terraform-test-rg"
}

variable "location" {
    type    = string
    default = "East US"
}

variable "vnet_name" {
    type    = string
    default = "vnet-test"
}

variable "subnet_name" {
    type    = string
    default = "subnet-test"
}

variable "nic_name" {
    type    = string
    default = "subnet-test"
}

variable "nic_name" {
    type    = string
    default = "nic-test"
}

variable "vm_name" {
    type    = string
    default = "vm-test"
}

variable "admin_username" {
    type    = string
    default = "adminuser" 
}

variable "admin_password" {
    type      = string
    sensitive = true
}