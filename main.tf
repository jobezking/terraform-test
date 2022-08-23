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
  #credentials = file("/mnt/chromeos/removable/expand/terraform-auth/terraform-gcp-77.json")
  credentials = file("/home/jeking/Desktop/terraform-auth/terraform-gcp-77.json")
  project = "terraform-gcp-77"
  region  = "us-central1"
  zone    = "us-central1-f"
}

resource "google_compute_instance" "vm_instance" {
  count = 3
  name         = "terraform-instance${count.index}"
  machine_type = "t2a-standard-1"
  zone         = "us-central1-f"
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11-bullseye-arm64-v20220719"
    }
  }
  network_interface {
    network = "default"
  }
}

variable "vm_names"{
  description = "list of the virtual machine names"
  type = list(string)
  default = ["vm1", "vm2", "vm3", "vm4", "vm5"]
}

resource "google_compute_instance" "named_instance" {
  count = length(var.vm_names)
  name         = var.vm_names[count.index]
  machine_type = "f1-micro"
  zone         = "us-central1-f"
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }
  network_interface {
    network = "default"
  }
}