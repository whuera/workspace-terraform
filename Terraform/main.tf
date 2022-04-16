    # Configure the Azure Provider
    provider "azurerm" {
    # whilst the `version` attribute is optional, we recommend pinning to a given version of the Provider
    version = "=0.12.3"
    features {}
  }
    resource "random_integer" "ri" {
    min = 10000
    max = 99999
  }

    resource "azurerm_resource_group" "rg" {
    name     = "appShoppingCartResourceGroup-${random_integer.ri.result}"
    location = "eastus"
  }

    resource "azurerm_app_service_plan" "appserviceplan" {
    name                = "webapp-asp-${random_integer.ri.result}"
    location            = azurerm_resource_group.rg.location
    resource_group_name = azurerm_resource_group.rg.name
    sku {
    tier = "Free"
    size = "F1"
  }
  }

    resource "azurerm_app_service" "webapp" {
    name                = "webapp-${random_integer.ri.result}"
    location            = azurerm_resource_group.rg.location
    resource_group_name = azurerm_resource_group.rg.name
    app_service_plan_id = azurerm_app_service_plan.appserviceplan.id
    source_control {
    repo_url           = "https://github.com/whuera/app-shopping-cart"
    branch             = "master"
    manual_integration = true
    use_mercurial      = false
  }
  }

    resource "resorce_shoppingcart" "rg-poc-terraform" {
    prefix    = var.resource_group_name_prefix
  }

    # Create a resource group
    resource "azurerm_resource_group" "rg-poc-terraform" {
    name     = "example-resources"
    location = "East US"
  }