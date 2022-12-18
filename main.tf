provider "google" {
  version     = "3.5.0"
  credentials = file(var.cred)
  project     = var.project
  region      = var.region
  zone        = var.zone
}

resource "google_compute_network" "vpc_network" {
  name = "internet-network"
  auto_create_subnetworks = "false"
}

module "subnetworks_public" {
  source = "./modules/subnetworks_pub"
  region = var.region
  network1 = google_compute_network.vpc_network.id
}

module "subnetworks_private" {
  source = "./modules/subnetworks_priv"
  region = var.region
  network1 = google_compute_network.vpc_network.id
}


