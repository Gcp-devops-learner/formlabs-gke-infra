terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "3.51.0"
    }
  }
}

provider "google" {
  // credentials = file(var.credentials_file_path)

  project = var.project_id
  region  = var.region
  zone    = var.main_zone
}

module "google_networks" {
  source = "./networks"

  project_id   = var.project_id
  region       = var.region
  network_name = var.network_name
  subnet_name  = var.subnet_name
  master_ipv4_cidr_block   = var.master_ipv4_cidr_block
  pods_ipv4_cidr_block     = var.pods_ipv4_cidr_block
  services_ipv4_cidr_block = var.services_ipv4_cidr_block
}

module "google_kubernetes_cluster" {
  source = "./kubernetes_cluster"

  project_id                 = var.project_id
  region                     = var.region
  node_zones                 = var.cluster_node_zones
  service_account            = var.service_account
  network_name               = var.network_name
  subnet_name                = var.subnet_name
  master_ipv4_cidr_block     = var.master_ipv4_cidr_block
  pods_ipv4_cidr_block       = var.pods_ipv4_cidr_block
  services_ipv4_cidr_block   = var.services_ipv4_cidr_block
  authorized_ipv4_cidr_block = "${module.bastion.ip}/32"
}

module "bastion" {
  source = "./bastion"

  project_id   = var.project_id
  region       = var.region
  zone         = var.main_zone
  bastion_name = "app-cluster"
  network_name = var.network_name
  subnet_name  = var.subnet_name
}