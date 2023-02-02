module "gcloud" {
  source  = "terraform-google-modules/gcloud/google"
  version = "3.1.2"

  platform = "linux"
  additional_components = ["kubectl", "beta"]

  create_cmd_entrypoint  = "gcloud"
  create_cmd_body        = "container fleet multi-cluster-services enable --project pingdirectory-358917"
  destroy_cmd_entrypoint = "gcloud"
  destroy_cmd_body       = "container fleet multi-cluster-services disable --project pingdirectory-358917"
}