resource "google_service_account" "secops_sa" {
  account_id   = "secops-service-account"
  display_name = "SecOps Service Account"
  project      = var.project_id
}

resource "google_service_account_key" "secops_sa_key" {
  service_account_id = google_service_account.secops_sa.name
}
