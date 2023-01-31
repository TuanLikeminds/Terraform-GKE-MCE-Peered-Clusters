resource "google_compute_subnetwork" "toronto-sub-net" {
  name          = "toronto-subnetwork"
  ip_cidr_range = "10.1.0.0/16"
  region        = "northamerica-northeast2" #Toronto, Ontario, North America
  network       = google_compute_network.toronto-vpc.id

  secondary_ip_range {
    range_name = "toronto-pod-range-1"
    ip_cidr_range = "10.2.0.0/17"
  }

  secondary_ip_range {
    range_name = "toronto-service-range-2"
    ip_cidr_range = "10.2.128.0/17"
  }
}

resource "google_compute_network" "toronto-vpc" {
  name                    = "toronto-network"
  auto_create_subnetworks = false
}