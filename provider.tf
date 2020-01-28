provider "google" {
  project = var.gcp_project_id
  region  = var.gcp_region
}

## Cloud IAM Conditions は ベータ版の機能なので、google-beta Providerを使う
provider "google-beta" {
  project = var.gcp_project_id
  region  = var.gcp_region
}
