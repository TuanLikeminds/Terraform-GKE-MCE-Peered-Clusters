resource "google_service_account" "montreal_gke_sa" {
  account_id   = "montreal-gke-sa"
  display_name = "montreal GKE Service Account"
}

resource "google_project_iam_binding" "montreal_gke_sa_binding" {
  project = "pingdirectory-358917"
  role    = "roles/compute.viewer"
  members = ["serviceAccount:${google_service_account.montreal_gke_sa.email}"]
}

resource "google_project_iam_binding" "montreal_gke_sa_binding_securityAdmin" {
  project = "pingdirectory-358917"
  role    = "roles/compute.securityAdmin"
  members = ["serviceAccount:${google_service_account.montreal_gke_sa.email}"]
}

resource "google_project_iam_binding" "montreal_gke_sa_binding_clusterAdmin" {
  project = "pingdirectory-358917"
  role    = "roles/container.clusterAdmin"
  members = ["serviceAccount:${google_service_account.montreal_gke_sa.email}"]
}

resource "google_project_iam_binding" "montreal_gke_sa_binding_developer" {
  project = "pingdirectory-358917"
  role    = "roles/container.developer"
  members = ["serviceAccount:${google_service_account.montreal_gke_sa.email}"]
}

resource "google_project_iam_binding" "montreal_gke_sa_binding_saAdmin" {
  project = "pingdirectory-358917"
  role    = "roles/iam.serviceAccountAdmin"
  members = ["serviceAccount:${google_service_account.montreal_gke_sa.email}"]
}

resource "google_project_iam_binding" "montreal_gke_sa_binding_saUser" {
  project = "pingdirectory-358917"
  role    = "roles/iam.serviceAccountUser"
  members = ["serviceAccount:${google_service_account.montreal_gke_sa.email}"]
}

resource "google_project_iam_binding" "montreal_gke_sa_binding_projectIamAdmin" {
  project = "pingdirectory-358917"
  role    = "roles/resourcemanager.projectIamAdmin"
  members = ["serviceAccount:${google_service_account.montreal_gke_sa.email}"]
}



