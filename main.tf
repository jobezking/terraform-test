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
  credentials = file("/home/jeking/Desktop/terraform-auth/terraform-gcp-77.json")

  project = "terraform-gcp-77"
  region  = "us-central1"
  zone    = "us-central1-f"
}

resource "google_compute_network" "vpc_network" {
  name = "terraform-network"
}

resource "google_compute_instance" "vm_instance" {
  name         = "terraform-instance"
  machine_type = "t2a-standard-1"
  zone         = "us-central1-f"
  boot_disk {
    initialize_params {
      image = var.arm-image
    }
  }
  network_interface {
    network = google_compute_network.vpc_network.name
  }
}

resource "google_compute_address" "vm_static_ip" {
  name = "terraform-static-ip"
}