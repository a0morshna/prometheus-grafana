output "grafana" {
  value = "http://${google_compute_instance.grafana.network_interface.0.access_config.0.nat_ip}:3000"
}

output "instance_ip" {
  value = "http://${google_compute_instance.instance.network_interface.0.access_config.0.nat_ip}:5000/"
}

output "prometheus" {
  value = "http://${google_compute_instance.prometheus.network_interface.0.access_config.0.nat_ip}:9090/"
}
