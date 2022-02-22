variable "firewall_ports" {}

variable "firewall_name" {}

variable "network_name"{}

variable "protocol_name"{}

variable "project_name"{}

variable "source_ranges" {
  type    = list(string)
  default = ["0.0.0.0/0"]
}
