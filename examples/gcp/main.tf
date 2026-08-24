terraform {
  required_providers { google = { source = "hashicorp/google", version = "7.44.0" } }
}
provider "google" { project = var.project; region = var.region }
module "gcp_vm" {
  source = "../../modules/gcp"
  name = var.name
  machine_type = var.machine_type
  zone = var.zone
  image = var.image
  network_name = var.network_name
}
output "instance_id" { value = module.gcp_vm.instance_id }
output "public_ip" { value = module.gcp_vm.public_ip }
