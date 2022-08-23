terraform {
  required_version = ">= 1.0.0"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 4.0.0"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = ">= 4.0.0"
    }
  }
}

provider "google" {
  credentials = file("/mnt/chromeos/removable/expand/terraform-auth/terraform-gcp-77.json")

  project = "terraform-gcp-77"
  region  = "us-central1"
  zone    = "us-central1-f"
}