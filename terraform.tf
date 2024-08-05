terraform { 
  cloud { 
    
    organization = "dang12394" 

    workspaces { 
      name = "swa-db-azure" 
    } 
  } 
  required_providers {
    azurerm ={
        source = "hashicorp/azurerm"
        version ="3.114.0"
    }
  }
}

provider "azurerm" {
  features {}
}