variable "aks_subnet_name" {
    type = string
    description = "The name of the subnet to deploy AKS onto."
}

variable "aks_vnet_name" {
    type = string
    description = "The name of the vnet to deploy AKS onto."
}

variable "aks_vnet_rg" {
    type = string
    description = "The name of the resource group to deploy AKS into."
}

variable "cluster_name" {
    type = string
    description = "The name for the AKS cluster."
}

variable "dns_prefix" {
    type = string
    description = "DNS prefix specified when creating the managed cluster."
}

variable "region" {
    type = string
    description = "The Azure region to deploy to."
}

variable "resource_group" {
    type = string
    description = "The Azure resource group the AKS cluster belongs to."
}

variable "node_admin_username" {
    type = string
    description = "The SSh username for AKS node access."
}

variable "node_admin_ssh_pub_key" {
    type = string
    description = "The public key for the SSH user."
}

variable "aks_network_plugin" {
    type = string
    description = "The network plugin the AKS should use."
}

variable "aks_pod_cidr" {
    type = string
    description = "The network CIDR block for the pod network."
}

variable "aks_service_cidr" {
    type = string
    description = "The Network Range used by the Kubernetes service."
}

variable "aks_docker_bridge_cidr" {
    type = string
    description = "IP address (in CIDR notation) used as the Docker bridge IP address on nodes."
}

variable "aks_dns_service_ip" {
    type = string
    description = "IP address within the Kubernetes service address range that will be used by cluster service discovery (kube-dns)."
}

variable "cluster_node_count" {
    type = string
    description = "The number of nodes in the node pool."
}

variable "cluster_node_vm_size" {
    type = string
    description = "The size of the VM's being used for nodes."
}

variable "cluster_node_vm_disk_size" {
    type = string
    description = "The disk size on the AKS nodes."
}

variable "aks_service_principal_id" {
    type = string
    description = "The service principal client id used by AKS."
}

variable "aks_service_principal_secret" {
    type = string
    description = "The service principal client secret used by AKS."
}
