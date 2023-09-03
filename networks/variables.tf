variable "project_id" {
  type        = string
  description = "The project ID to host the network in"
}

variable "region" {
  type        = string
  description = "The region to use"
}

variable "network_name" {
  type        = string
  description = "network name"
}

variable "subnet_name" {
  type        = string
  description = "subnet name"
}

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
