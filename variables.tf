variable "project_id" {
  description = "Google Cloud Platform (GCP) Project ID."
  type        = string
  default     = "sixth-zoo-337808"
}

variable "project_name" {
  description = "Google Cloud Platform (GCP) Project name."
  type        = string
  default     = "cicd-task"
}

variable "region" {
  description = "GCP region name."
  type        = string
  default     = "europe-west1"
}

variable "zone" {
  description = "GCP zone name."
  type        = string
  default     = "europe-west1-c"
}

variable "network_name" {
  type    = string
  default = "monitoring-network"
}

variable "subnet_name" {
  type    = string
  default = "monitoring-subnet"
}

variable "ip_range" {
  type    = string
  default = "0.0.0.0/0"
}

variable "firewall_ports" {
  type    = list
  default = ["22","80","3000","5000","8080","9090","9100","9115"]
}

variable "firewall_name" {
  type    = string
  default = "firewall-monitoring"
}

variable "protocol_name" {
  type    = string
  default = "tcp"
}

variable "machine_type" {
  description = "GCP VM instance machine type."
  type        = string
  default     = "e2-micro"
}

variable "image" {
  description = "GCP VM instance image."
  type        = string
  default     = "ubuntu-os-cloud/ubuntu-1804-lts"
}

variable "docker_username" {
  type      = string
  sensitive = true
}

variable "docker_password" {
  type      = string
  sensitive = true
}

variable "machine_type_custom" {
  type    = string
  default = "e2-custom-1-1024"
}

variable "disk_type" {
  description = "The GCE disk type. Can be either pd-ssd, local-ssd, or pd-standard."
  default     = "pd-ssd"
}

variable "disk_size_gb" {
  description = "The size of the image in gigabytes."
  default     = 10
}

variable "region_net" {
  type        = string
  default     = "europe-west1"
}