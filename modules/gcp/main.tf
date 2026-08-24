data "google_compute_network" "default" { name = var.network_name }
resource "google_compute_instance" "vm" {
  name = var.name
  machine_type = var.machine_type
  zone = var.zone
  boot_disk { initialize_params { image = var.image } }
  network_interface { network = data.google_compute_network.default.self_link; access_config {} }
  metadata = { enable-oslogin = "TRUE" }
  labels = { project = "devops-project-21", cloud = "gcp", managedby = "terraform" }
}
output "instance_id" { value = google_compute_instance.vm.id }
output "public_ip" { value = google_compute_instance.vm.network_interface[0].access_config[0].nat_ip }
