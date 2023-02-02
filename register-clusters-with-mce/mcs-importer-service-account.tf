resource "google_project_iam_binding" "pingdirectory_network_viewer" {
  project = "pingdirectory-358917"
  role    = "roles/compute.networkViewer"
  members = [
    "serviceAccount:pingdirectory-358917.svc.id.goog[gke-mcs/gke-mcs-importer]"
  ]
}
