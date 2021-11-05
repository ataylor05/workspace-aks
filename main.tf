locals {
  region          = "EastUS2"
  environment_tag = "Dev"
}

module "aks" {
  source                         = "./terraform-azure-kubernetes-service/"
  # General vars
  region                         = local.region
  environment_tag                = local.environment_tag
  cluster_name                   = "test"
  resource_group                 = "aks"
  aks_version                    = "1.20.9"
  # Network vars
  aks_subnet_name                = "default"
  aks_vnet_name                  = "aks"
  aks_vnet_rg                    = "aks"
  dns_prefix                     = "ataylor-test"
  network_policy                 = "calico"
  # Cluster vars
  aad_admin_group                = ["02b5231c-637d-4211-b4ef-dc583cac192f"]
  node_admin_username            = "DTR"
  node_admin_ssh_pub_key         = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC/Ar742uGirB+ofXQdC8/28QucVYXGC4W69A7t0WVflXnGNTox7+7QzGL31sSzpa0pnbVIZ1lHFSYj8sE7EZJgS+eilv5/zV3WF1bTTvB9u/knQPnjXj5zP9Oqr7HSDZKNxEGB3DY2Z2oYD6CYsQ8jJx5NuVy2AUqdmp40gRf7h6Jc7ZaPXp2XLaYU1yjottBDsqiH/ECE7v9YcQOxG/2W6fCOXnFHFesxs9MVlCIS/ld+O72zYoQyaH7N9i1lpnPCTHiNdJ+qezFmmOmvaj3icAdbbnnlZJAbgPKvMrmgnZPiyW9VLN/6TiSDNZi/0tUsZj6tInyZN33dhS7cYjP1zkoqGqWewwViogryFMm4bDwOI4K6S+O/+taGFYmcl18LchPlUdQxrYVgvKvAjAe5vQVCJmw7hv6jqhPF2K8LOLRW7jdY4xPK+jji6OH7t/6BMqJ0cxZk4mkFLEB0uI7dWH22q4OlPJM0UqjDvtxfXir1tGXTZaJuQL7BxVou7UE="
  cluster_node_vm_disk_size      = 1024
  cluster_node_vm_size           = "Standard_B2s"
  cluster_auto_scaling_max_nodes = 10
  local_account_disabled         = false
  azure_policy                   = false
  sku_tier                       = "Free"
  kube_dashboard                 = false
  # Maintenance window
  maintenance_window_day         = "Saturday"
  maintenance_window_time_frame  = [23,0,1,2,3]
}
