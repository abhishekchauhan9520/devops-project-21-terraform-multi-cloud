variable "project" { type = string }
variable "region" { type = string default = "us-central1" }
variable "name" { type = string default = "gcp-multicloud-demo" }
variable "machine_type" { type = string default = "e2-micro" }
variable "zone" { type = string default = "us-central1-a" }
variable "image" { type = string default = "debian-cloud/debian-12" }
variable "network_name" { type = string default = "default" }
