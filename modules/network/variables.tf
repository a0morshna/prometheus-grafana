variable "region_net" {}

variable "network_name" {}

variable "subnet_name" {}

variable "project_id" {}

variable "ip_cidr_range" { 
  type    = string
  default = "10.0.2.0/24"
}