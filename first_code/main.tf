provider "azurerm" {
    features {}
}

resource "azurerm_resource_group" "rg" {
    name = "var.resource_group_name"
    location = "var.location"
}

resource "azurerm_virtual_network" "vnet" {
    name                = "var.vnet_name"
    location            = azurerm_resource_group.rg.location
    resource_group_name = azurerm_resource_group.rg.name
    address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "subnet" {
    name                    = "var.subnet_name"
    resource_group_name     = azurerm_resource_group.rg.name
    virtual_network_name    = azurerm_virtual_network.vnet.name
    address_prefixes        = ["10.0.1.0/24"]
}

resource "azurerm_network_interface" "nic" {
    name                = "var.nic_name"
    location            = azurerm_resource_group.rg.location
    resource_group_name = azurerm_resource_group.rg.name

    ip_configuration {
        name                            = "internal"
        subnet_id                       = azurerm_subnet.subnet.id
        private_ip_address_allocation   = "Dynamic"
    }
}

resource "azurer_virtual_machine" "vm" {
    name                    = "var.vm_name"
    location                = azurerm_resource_group.rg.location
    resource_group_name     = azurerm_resource_group.rg.name
    networt_interface_ids   = [azurerm_network_interface.nic.id]
    vm_size                 = "Standard_B1s"

    storage_os_disks {
        name                = "${var.vm_name}-osdisk"
        caching             = "ReadWrite"
        create_option       = "FromImage"
        managed_disk_type   = "Standard_LRS"
    }

    storage_image_reference {
        publisher   = "Canonical"
        offer       = "UbuntuServer"
        sku         = "22.04-LTS"
        version     = "latest"
    }

    os_profile {
        computer_name   = "var.vm_name"
        admin_username  = "var.admin_username"
        admin_password  = "var.admin_password"
    }

    os_profile_linux_config {
        disable_password_authentication = false
    }
}