resource "google_compute_network" "monitoring-network" {
  name                    = var.network_name
  project                 = var.project_id
  auto_create_subnetworks = "false"
}

resource "google_compute_subnetwork" "monitoring-subnet" {
  name          = var.subnet_name
  ip_cidr_range = "10.0.2.0/24"
  region        = var.region_net
  project       = var.project_id
  network       = google_compute_network.monitoring-network.name
  depends_on    = [google_compute_network.monitoring-network]
}
