output "network_name"{
  value = google_compute_network.monitoring-network.self_link 
}

output "subnetwork_name" {
  value = google_compute_subnetwork.monitoring-subnet.self_link 
}
