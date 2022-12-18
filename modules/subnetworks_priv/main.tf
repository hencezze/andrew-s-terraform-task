resource "google_compute_subnetwork" "private-subnetworks" {

  for_each = {
 
  "private1" = "10.10.1.0/24" 

  "private2" = "10.10.2.0/24"

  "private3" = "10.10.3.0/24"
 
  }

  name          = each.key
  ip_cidr_range = each.value
  region        = var.region
  network       = var.network1
  private_ip_google_access = true
}

