terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
    }
  }
}

provider "azurerm" {
  features {}
}

provider "kubernetes" {
  host                   = module.aks.aks_kube_admin_config.0.host
  username               = module.aks.aks_kube_admin_config.0.username
  password               = module.aks.aks_kube_admin_config.0.password
  client_certificate     = base64decode(module.aks.aks_kube_admin_config.0.client_certificate)
  client_key             = base64decode(module.aks.aks_kube_admin_config.0.client_key)
  cluster_ca_certificate = base64decode(module.aks.aks_kube_admin_config.0.cluster_ca_certificate)
}
