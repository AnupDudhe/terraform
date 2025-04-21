
terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0"
    }
  }

  required_version = ">= 1.0.0"
}

provider "google" {
  credentials = file("<path-to-your-service-account-json>")  # or skip if using gcloud auth
  project     = ""
  region      = "us-central1"
  zone        = "us-central1-a"
}

resource "google_compute_instance" "default" {
  name         = "my-vm-instance"
  machine_type = "e2-medium"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }

  network_interface {
    network = "default"

    access_config {
      # Ephemeral public IP
    }
  }
}
