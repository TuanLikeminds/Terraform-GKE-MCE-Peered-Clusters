resource "google_service_account" "toronto_gke_sa" {
  account_id   = "toronto-gke-sa"
  display_name = "Toronto GKE Service Account"
}


resource "google_project_iam_binding" "bind_toronto_gke_sa_to_artifact_registry" {
  project = "pingdirectory-358917"
  role    = "roles/artifactregistry.writer"
  members = ["serviceAccount:${google_service_account.toronto_gke_sa.email}"]
}

resource "google_project_iam_binding" "toronto_gke_sa_binding" {
  project = "pingdirectory-358917"
  role    = "roles/compute.viewer"
  members = ["serviceAccount:${google_service_account.toronto_gke_sa.email}"]
}

resource "google_project_iam_binding" "toronto_gke_sa_binding_securityAdmin" {
  project = "pingdirectory-358917"
  role    = "roles/compute.securityAdmin"
  members = ["serviceAccount:${google_service_account.toronto_gke_sa.email}"]
}

resource "google_project_iam_binding" "toronto_gke_sa_binding_clusterAdmin" {
  project = "pingdirectory-358917"
  role    = "roles/container.clusterAdmin"
  members = ["serviceAccount:${google_service_account.toronto_gke_sa.email}"]
}

resource "google_project_iam_binding" "toronto_gke_sa_binding_developer" {
  project = "pingdirectory-358917"
  role    = "roles/container.developer"
  members = ["serviceAccount:${google_service_account.toronto_gke_sa.email}"]
}

resource "google_project_iam_binding" "toronto_gke_sa_binding_saAdmin" {
  project = "pingdirectory-358917"
  role    = "roles/iam.serviceAccountAdmin"
  members = ["serviceAccount:${google_service_account.toronto_gke_sa.email}"]
}

resource "google_project_iam_binding" "toronto_gke_sa_binding_saUser" {
  project = "pingdirectory-358917"
  role    = "roles/iam.serviceAccountUser"
  members = ["serviceAccount:${google_service_account.toronto_gke_sa.email}"]
}

resource "google_project_iam_binding" "toronto_gke_sa_binding_projectIamAdmin" {
  project = "pingdirectory-358917"
  role    = "roles/resourcemanager.projectIamAdmin"
  members = ["serviceAccount:${google_service_account.toronto_gke_sa.email}"]
}


resource "google_project_iam_binding" "toronto_gke_sa_binding_secrets_user" {
  project = "pingdirectory-358917"
  members = ["serviceAccount:${google_service_account.toronto_gke_sa.email}"]
  role = "roles/secretmanager.viewer"
}

resource "google_project_iam_binding" "toronto_gke_sa_binding_secrets_user_access" {
  project = "pingdirectory-358917"
  members = ["serviceAccount:${google_service_account.toronto_gke_sa.email}"]
  role = "roles/secretmanager.versions.access"
}

