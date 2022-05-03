provider "azurerm" {
  # whilst the `version` attribute is optional, we recommend pinning to a given version of the Provider
  version = "=2.20.0"
  features {}
  client_id =var.client_id
  tenant_id=var.tenant_id
  subscription_id=var.subscription_id
  client_secret = var.client_secret
}


resource "azurerm_public_ip" "example" {
  name                    = "mynet32"
  location                = var.location
  resource_group_name     = var.resource_group_name
  allocation_method       = "Dynamic"
  idle_timeout_in_minutes = 30

  tags = {
    environment = "test"
  }
}

resource "azurerm_network_interface" "example" {
  name                = var.NIname
  location            = var.location
  resource_group_name = var.resource_group_name
  

  ip_configuration {
    name                          = var.InternalName
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = var.private_ip_address_allocation
	 public_ip_address_id          = azurerm_public_ip.example.id
   
  }
}

resource "azurerm_network_interface_security_group_association" "example" {
    network_interface_id      = azurerm_network_interface.example.id
    network_security_group_id ="/subscriptions/e1278e49-b64c-4169-8005-c2a926076072/resourceGroups/CMASRG/providers/Microsoft.Network/networkSecurityGroups/mcmaapp21-nsg"	
}


resource "azurerm_linux_virtual_machine" "example" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = var.size
  admin_username      = var.admin_username
  admin_password    = var.admin_password
  disable_password_authentication =var.disable_password_authentication
  network_interface_ids = [azurerm_network_interface.example.id]
  
/*
  admin_ssh_key {
    username   = var.admin_username
    public_key = file(var.public_key_path)
  }
*/
  os_disk {
    caching              = var.caching
    storage_account_type = var.storage_account_type
  }

  source_image_reference {
    publisher = var.publisher
    offer     = var.offer
    sku       = var.sku
    version   = var.version_name
  }
  tags = {
    
	primary_owner = var.tag_primary
	secondary_owner = var.tag_Secondary
	project_name = var.tag_PName
	project_code = var.tag_Pcode
	  }
}



resource "azurerm_virtual_machine_extension" "example" {
  name                 = "hostname"
  virtual_machine_id   = azurerm_linux_virtual_machine.example.id
  publisher            = "Microsoft.Azure.Extensions"
  type                 = "CustomScript"
  type_handler_version = "2.0"

  settings = <<SETTINGS
    {
        "fileUris": ["https://mcmastorage.blob.core.windows.net/script/install_mcmaapp.sh"],
        "commandToExecute": "sh install_mcmaapp.sh "
    }
SETTINGS
tags = {
    primary_owner = var.tag_primary
	secondary_owner = var.tag_Secondary
	project_name = var.tag_PName
	project_code = var.tag_Pcode
  }
  provisioner "remote-exec" {
     connection {
    type     = "ssh"
    user     = "${var.admin_username}"
    password = "${var.admin_password}"
    host     = "${data.azurerm_public_ip.example.ip_address}"
  }
    inline = [
      
      "sudo  sh /var/lib/waagent/custom-script/download/0/MCMA/start.sh  ${data.azurerm_public_ip.example.ip_address} ",
    ]
  }
}

data "azurerm_public_ip" "example" {
  name                = azurerm_public_ip.example.name
  resource_group_name = azurerm_linux_virtual_machine.example.resource_group_name
}

output "public_ip_address" {
  value =data.azurerm_public_ip.example.ip_address
}
