resource "google_artifact_registry_repository" "my-repo" {
  location = "northamerica-notheast1"
  repository_id = "likeminds-ping-images"
  description = "to host custom docker images created by google cloud build to be used by ping pods on GKE"
  format = "DOCKER"
#   kms_key_name = "KEY"
}