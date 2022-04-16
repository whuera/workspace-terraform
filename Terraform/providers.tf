  terraform {

    required_version = ">=0.12"

    required_providers {
    azurerm = {
    source = "hashicorp/azurerm"
  version = "=0.12.3"
    }
    }
  }

    provider "azurerm" {
    features {}
  }