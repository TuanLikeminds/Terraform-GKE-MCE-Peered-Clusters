#########################TORONTO VPC AND SUBNET###################################

resource "google_compute_subnetwork" "toronto_sub_net" {
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
#########################MONTREAL VPC AND SUBNET###################################

resource "google_compute_subnetwork" "montreal_sub_net" {
  name          = "montreal-subnetwork"
  ip_cidr_range = "172.16.0.0/16"
  region        = "northamerica-northeast1" #Montréal, Québec, North America
  network       = google_compute_network.montreal-vpc.id

  secondary_ip_range {
    range_name = "montreal-pod-range-1"
    ip_cidr_range = "192.168.64.0/18"
  }

  secondary_ip_range {
    range_name = "montreal-service-range-2"
    ip_cidr_range = "192.168.128.0/17"
  }
}

resource "google_compute_network" "montreal-vpc" {
  name                    = "montreal-network"
  auto_create_subnetworks = false
}

#########################PEERINGS###################################
resource "google_compute_network_peering" "peering1" {
  name         = "toronto-to-montreal-peering-1"
  network      = google_compute_network.toronto-vpc.self_link
  peer_network = google_compute_network.montreal-vpc.self_link
}

resource "google_compute_network_peering" "peering2" {
  name         = "montreal-to-toronto-peering-2"
  network      = google_compute_network.montreal-vpc.self_link
  peer_network = google_compute_network.toronto-vpc.self_link

}
####################################################################
