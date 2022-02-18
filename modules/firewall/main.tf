resource "google_compute_firewall" "monitoring" {
    name    = var.firewall_name
    network = var.network_name
    project = var.project_name

    source_ranges = ["0.0.0.0/0"]

    allow {
        protocol = var.protocol_name
        ports    = var.firewall_ports
    }
}