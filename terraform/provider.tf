terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0"
    }
    googleworkspace = {
      source  = "hashicorp/googleworkspace"
      version = "~> 0.7.0"
    }
  }
}

provider "google" {
  credentials = file("../creds/terraform-securitydude-JWT.json")
}

provider "googleworkspace" {
  credentials = file("../creds/terraform-securitydude-JWT.json")
  customer_id = "663468139659"
}