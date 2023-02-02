
#TORONTO GKE CLUSTER MEMBERSHIP
resource "google_gke_hub_membership" "toronto_cluster_membership" {
  provider = google-beta
  project = "pingdirectory-358917"
  membership_id = "toronto-gke-cluster"
  endpoint {
    gke_cluster {
     resource_link = "//container.googleapis.com/projects/pingdirectory-358917/locations/northamerica-northeast2/clusters/gke-toronto"
    }
  }
}

#MONTREAL GKE CLUSTER MEMBERSHIP

resource "google_gke_hub_membership" "montreal_cluster_membership" {
  provider = google-beta
  project = "pingdirectory-358917"
  membership_id = "montreal-gke-cluster"
  endpoint {
    gke_cluster {
     resource_link = "//container.googleapis.com/projects/pingdirectory-358917/locations/northamerica-northeast1/clusters/gke-montreal"
    }
  }
}
