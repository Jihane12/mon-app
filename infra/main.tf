terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "staging" {
  name     = "rg-staging"
  location = "francecentral"
}

resource "azurerm_service_plan" "plan" {
  name                = "asp-staging"
  resource_group_name = azurerm_resource_group.staging.name
  location            = azurerm_resource_group.staging.location
  os_type             = "Linux"
  sku_name            = "B1"
}

resource "azurerm_linux_web_app" "app" {
  name                = var.app_name
  resource_group_name = azurerm_resource_group.staging.name
  location            = azurerm_resource_group.staging.location
  service_plan_id     = azurerm_service_plan.plan.id

  site_config {
    application_stack {
      docker_image_name        = "mon-app:latest"
      docker_registry_url      = "https://${var.acr_registry}"
      docker_registry_username = var.acr_username
      docker_registry_password = var.acr_password
    }
  }
}
