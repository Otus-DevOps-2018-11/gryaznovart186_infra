# Правило firewall для SSH
resource "google_compute_firewall" "firewall_ssh" {
  name        = "default-allow-ssh"
  description = "Allow SSH rule"
  network     = "default"

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = "${var.source_ranges}"
}

# Добавить SSH ключь
resource "google_compute_project_metadata_item" "ssh" {
  key   = "ssh-keys"
  value = "gryaznovart186:${file("${var.public_key_path}")}"
}
