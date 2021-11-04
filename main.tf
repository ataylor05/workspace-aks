locals {
  region          = "EastUS2"
  environment_tag = "Dev"
}

module "aks" {
  source                       = "github.com/ataylor05/terraform-azure-kubernetes-service"
  aks_subnet_name              = "default"
  aks_vnet_name                = "aks"
  aks_vnet_rg                  = "aks"
  cluster_name                 = "test"
  dns_prefix                   = "ataylor-test"
  region                       = local.region
  resource_group               = "${local.region}--K8S-RG"
  node_admin_username          = "allan"
  node_admin_ssh_pub_key       = var.ssh_pub_key
  aks_network_plugin           = "kubenet"
  aks_service_cidr             = "10.254.0.0/24"
  aks_docker_bridge_cidr       = "10.254.1.2/32"
  aks_dns_service_ip           = "10.254.0.254"
  aks_pod_cidr                 = "10.255.0.0/16"
  cluster_node_count           = "1"
  cluster_node_vm_disk_size    = "100"
  cluster_node_vm_size         = "Standard_B2s"
  aks_service_principal_id     = var.aks_service_principal_id
  aks_service_principal_secret = var.aks_service_principal_secret
}
