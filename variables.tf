variable "project_id" {
  type        = string
  description = "The ID of the project to create resources in"
}

variable "region" {
  type        = string
  description = "The region to use"
}

variable "main_zone" {
  type        = string
  description = "The zone to use as primary"
}

variable "cluster_node_zones" {
  type        = list(string)
  description = "The zones where Kubernetes cluster worker nodes should be located"
}

variable "service_account" {
  type        = string
  description = "The GCP service account"
}

variable "network_name" {
  type        = string
  description = "network name"
}

variable "subnet_name" {
  type        = string
  description = "subnet name"
}


# variable "cluster_master_ip_cidr_range" {
#   type        = string
#   description = "cluster master ip cidr range"
# }

# variable "cluster_pods_ip_cidr_range" {
#   type        = string
#   description = "cluster pods ip cidr range"
# }

# variable "cluster_services_ip_cidr_range" {
#   type        = string
#   description = "cluster services ip cidr range"
# }

variable "pods_ipv4_cidr_block" {
  type        = string
  description = "The CIDR block to use for pod IPs"
}

variable "services_ipv4_cidr_block" {
  type        = string
  description = "The CIDR block to use for the service IPs"
}


variable "master_ipv4_cidr_block" {
  type        = string
  description = "The /28 CIDR block to use for the master IPs"
}