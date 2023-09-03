
locals {

  #   cluster_master_ip_cidr_range   = "10.100.100.0/28"
  #   cluster_pods_ip_cidr_range     = "10.101.0.0/16"
  #   cluster_services_ip_cidr_range = "10.102.0.0/16"

  master_ipv4_cidr_block   = var.master_ipv4_cidr_block
  pods_ipv4_cidr_block     = var.pods_ipv4_cidr_block
  services_ipv4_cidr_block = var.services_ipv4_cidr_block
}


resource "google_compute_network" "vpc" {
  name                            = var.network_name
  auto_create_subnetworks         = false
  routing_mode                    = "GLOBAL"
  delete_default_routes_on_create = true
}

resource "google_compute_subnetwork" "subnet" {
  name                     = var.subnet_name
  ip_cidr_range            = "10.10.0.0/16"
  region                   = var.region
  network                  = var.network_name
  private_ip_google_access = true
}

resource "google_compute_route" "egress_internet" {
  name             = "egress-internet"
  dest_range       = "0.0.0.0/0"
  network          = var.network_name
  next_hop_gateway = "default-internet-gateway"
}

resource "google_compute_router" "router" {
  name    = "${var.network_name}-router"
  region  = var.region
  network = var.network_name
}

resource "google_compute_router_nat" "nat_router" {
  name                               = "${google_compute_subnetwork.subnet.name}-nat-router"
  router                             = google_compute_router.router.name
  region                             = var.region
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"

  subnetwork {
    name                    = var.subnet_name
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }

  log_config {
    enable = true
    filter = "ERRORS_ONLY"
  }
}