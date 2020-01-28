# サービスアカウント設定は役割との紐付けまで管理する
# 鍵は別管理とする
resource "google_service_account" "sa_ssh" {
  account_id   = "sa-ssh"
  display_name = "ssh"
}

resource "google_project_iam_member" "sa_ssh" {
  provider = google-beta
  for_each = var.role_sa_ssh

  project = var.gcp_project_id
  role    = each.value["role"]
  member  = "serviceAccount:${google_service_account.sa_ssh.email}"

  dynamic condition {
    for_each = contains(keys(each.value), "condition") ? [each.value["condition"]] : []
    content {
      title       = condition.value.title
      description = condition.value.description
      expression  = condition.value.expression
    }
  }
}
