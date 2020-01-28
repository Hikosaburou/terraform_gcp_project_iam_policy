# GCP Settings
variable "gcp_project_id" {
  description = "GCP Project ID"
  type        = string

  default = "test-project"
}

variable "gcp_sa_key" {
  description = "Service account key file for Terraform plan/apply"
  type        = string

  default = "gcp-sa-key.json"
}

variable "gcp_region" {
  description = "Main Region"
  type        = string

  default = "asia-northeast1"
}

# Cloud IAM Settings
variable "role_sa_ssh" {
  description = "Roles for sa-ssh account"

  default = {
    instanceadmin = {
      role = "roles/compute.instanceAdmin.v1"
    },
    compute_ssh = {
      role = "roles/compute.osAdminLogin"
    },
    iap_tunnelresourceaccessor = {
      role = "roles/iap.tunnelResourceAccessor"
      conditions = [
        {
          title       = "restrict_tcp_tunneling"
          description = "Allow access for destination port 22 in the request"
          expression  = "destination.port == 22"
        }
      ]
    },
    sauser = {
      role = "roles/iam.serviceAccountUser"
    }
  }
}
