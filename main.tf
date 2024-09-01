provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
}

terraform {
  backend "gcs" {
    bucket  = "tf-state-prod-1"
    prefix  = "terraform/state"
  }
}

# variable "vms" {
#   description = "Map of VMs with their configurations"
#   type = map(object({
#     name      = string
#     disk_size = number
#   }))
# }

resource "google_compute_instance" "vm" {

  name         = var.vm_name
  machine_type = "n1-standard-1"
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
      size = var.disk_size
      type = "pd-standard"  # or "pd-ssd"
    }
  }

  network_interface {
    network = "default"
    access_config {}
  }

  tags = ["http-server", "https-server"]

  metadata_startup_script = <<-EOT
    #! /bin/bash
    echo "Hello, World!" > /var/www/html/index.html
  EOT
}
