# backend.tf file is used to store the state file in Azure Storage Account
terraform {
    backend "azurerm" {
        storage_account_name = "mehmetosanmazacc" # Use your own unique name here
        container_name       = "terraform-sample"        # Use your own container name here
        key                  = "terraform.tfstate"       # Add a name to the state file
        resource_group_name  = "MehmetOsanmazRG"         # Use your own resource group name here
    }
}