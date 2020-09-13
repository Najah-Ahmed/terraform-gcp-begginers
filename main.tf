provider "google" {
  credentials = file("credentials/servers.json")
  project     = "server-configure-a"
  region      = "us-central1"
  zone        = "us-central1-c"
}
resource "google_compute_instance" "vm_instance" {
  name         = "terraform-instance-njh2"
  machine_type = "f1-micro"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }
  metadata = {
    ssh-keys = "INSERT_USERNAME:${file("~/.ssh/id_rsa_gcp.pub")}"
  }

  network_interface {
    # A default network is created for all GCP projects
    network = "default"
    access_config {
    }
  }
  # output "ip" {
  #   value = google_compute_instance.default.network_interface.0.access_config.0.nat_ip
  # }
  # allow {
  #   protocol = "tcp"
  #   ports    = ["5000"]
  # }

}

