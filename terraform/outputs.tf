output "service_account_unique_id" {
  value       = google_service_account.secops_sa.unique_id
  description = "The unique ID of the SecOps service account"
}

output "service_account_email" {
  value       = google_service_account.secops_sa.email
  description = "The email address of the SecOps service account"
}

output "secops_user_password" {
  value       = random_password.secops_user_password.result
  description = "The generated password for the SecOps user"
  sensitive   = true
}