resource "google_compute_subnetwork" "subnetworks_public" {

  for_each = {

  "public1" = "10.10.4.0/24"

  "public2" = "10.10.5.0/24"

  "public3" = "10.10.6.0/24"

  }

  name          = each.key
  ip_cidr_range = each.value
  region        = var.region
  network       = var.network

}


