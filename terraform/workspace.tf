resource "googleworkspace_role" "secops_role" {
  name = "SecOps-Impersonation"
  privileges {
    api_name           = "reporting_api"
    privilege_name     = "VIEWREPORTS_FULL"
    service_id         = "reporting"
  }
  privileges {
    api_name           = "alert_center_api"
    privilege_name     = "ALERT_CENTER_VIEW"
    service_id         = "alert_center"
  }
  privileges {
    api_name           = "mobile_management_api"
    privilege_name     = "MANAGE_DEVICES_AND_SETTINGS"
    service_id         = "mobile"
  }
  privileges {
    api_name           = "chrome_management_api"
    privilege_name     = "MANAGE_CHROME_SETTINGS"
    service_id         = "chrome"
  }
  privileges {
    api_name           = "admin_api"
    privilege_name     = "USERS_READONLY"
    service_id         = "admin"
  }
  privileges {
    api_name           = "admin_api"
    privilege_name     = "GROUPS_READONLY"
    service_id         = "admin"
  }
}

resource "googleworkspace_domain_wide_delegation" "secops_delegation" {
  client_id = google_service_account.secops_sa.unique_id
  
  scopes = [
    "https://www.googleapis.com/auth/admin.reports.audit.readonly",
    "https://www.googleapis.com/auth/apps.alerts",
    "https://www.googleapis.com/auth/admin.directory.device.chromeos.readonly",
    "https://www.googleapis.com/auth/admin.directory.group.readonly",
    "https://www.googleapis.com/auth/admin.directory.device.mobile.readonly",
    "https://www.googleapis.com/auth/admin.directory.rolemanagement.readonly",
    "https://www.googleapis.com/auth/admin.directory.user.readonly"
  ]
}

resource "googleworkspace_user" "secops_user" {
  primary_email = "SecOps-Ingestion-User@securitydude.us"
  password      = random_password.secops_user_password.result
  
  name {
    given_name  = "SecOps"
    family_name = "Ingestion User"
  }
}

resource "random_password" "secops_user_password" {
  length  = 16
  special = true
}

resource "googleworkspace_role_assignment" "secops_role_assignment" {
  role_id = googleworkspace_role.secops_role.id
  user_id = googleworkspace_user.secops_user.id
}