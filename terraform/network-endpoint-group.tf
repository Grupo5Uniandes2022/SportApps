# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network_endpoint_group
resource "google_compute_network_endpoint_group" "neg" {
  name         = "main"
  network      = google_compute_network.main.id
  subnetwork   = google_compute_subnetwork.private.id
  default_port = "90"
  zone         = "us-central1-c"
}