output "network" {
  value       = google_compute_network.vpc
  description = "The VPC"
}

output "subnet" {
  value       = google_compute_subnetwork.subnet
  description = "The subnet"
}

output "master_ipv4_cidr_block" {
  value       = local.master_ipv4_cidr_block
  description = "The CIDR range to use for Kubernetes cluster master"
}

output "pods_ipv4_cidr_block" {
  value       = local.pods_ipv4_cidr_block
  description = "The CIDR range to use for Kubernetes cluster pods"
}

output "services_ipv4_cidr_block" {
  value       = local.services_ipv4_cidr_block
  description = "The CIDR range to use for Kubernetes cluster services"
}