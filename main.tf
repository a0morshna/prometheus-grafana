provider "google" {
  project     = var.project_id
  region      = var.region
  zone        = var.zone
}


resource "random_password" "password" {
  length  = 12
  special = false
}


resource "random_id" "login"{
  byte_length = 6
}


module "network" {
  source       = "./modules/network"
  network_name = var.network_name
  subnet_name  = var.subnet_name
  project_id   = var.project_id
  region_net   = var.region_net
}


module "firewall"{
  source         = "./modules/firewall"
  firewall_name  = var.firewall_name
  network_name   = var.network_name
  project_name   = var.project_id
  source_ranges  = var.ip_range
  firewall_ports = var.firewall_ports
  protocol_name  = var.protocol_name
  depends_on     = [module.network]
}


data "template_file" "script-prometheus" {
  template = file("./scripts/script-prometheus.sh")
  vars = {
    instance_ip = google_compute_instance.instance.network_interface.0.access_config.0.nat_ip
  }
}


resource "google_compute_instance" "prometheus" {
  zone         = var.zone
  name         = var.name_prometheus
  machine_type = var.machine_type

  metadata_startup_script = data.template_file.script-prometheus.rendered

  boot_disk {
    initialize_params {
      image = var.image
    }
  }

  network_interface {
    subnetwork = module.network.subnetwork_name

    access_config {
      // Ephemeral IP
    }
  }

  depends_on = [module.firewall, module.network]
}


data "template_file" "script-grafana" {
  template = file("./scripts/script-grafana.sh")
  vars = {
    login             = random_id.login.id,
    password          = random_password.password.result
  }
}


resource "google_compute_instance" "grafana" {
  zone         = var.zone
  name         = var.name_grafana
  machine_type = var.machine_type

  metadata_startup_script = data.template_file.script-grafana.rendered

  boot_disk {
    initialize_params {
      image = var.image
    }
  }

  network_interface {
    subnetwork = module.network.subnetwork_name

    access_config {
      // Ephemeral IP
    }
  }
 
  depends_on = [module.firewall, module.network]
}


data "template_file" "script-instance" {
  template = file("./scripts/script-instance.sh")
  vars = {
    docker_password = var.docker_password
    docker_username = var.docker_username
  }
}


resource "google_compute_instance" "instance" {
  zone         = var.zone
  name         = var.name_instance
  machine_type = var.machine_type_custom

  metadata_startup_script = data.template_file.script-instance.rendered

  boot_disk {
    initialize_params {
      image = var.image
      size  = var.disk_size_gb
      type  = var.disk_type
    }
  }

  network_interface {
    subnetwork = module.network.subnetwork_name

    access_config {
      // Ephemeral IP
    }
  }
  depends_on = [module.firewall, module.network]
}

