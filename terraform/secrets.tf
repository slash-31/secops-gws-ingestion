resource "google_secret_manager_secret" "sa_jwt" {
  secret_id = "secops-sa-jwt"
  project   = var.project_id

  replication {
    automatic = true
  }

  depends_on = [google_project_service.secret_manager]
}

resource "google_secret_manager_secret_version" "sa_jwt_version" {
  secret      = google_secret_manager_secret.sa_jwt.id
  secret_data = base64decode(google_service_account_key.secops_sa_key.private_key)
}