# Получение внешнего IP
resource "google_compute_address" "app_ip" {
  name = "reddit-app-ip"
}

# Создание ВМ для App
resource "google_compute_instance" "app" {
  count        = "${var.count_vm}"
  name         = "${format("reddit-app-%02d", count.index + 1)}"
  machine_type = "g1-small"
  zone         = "${var.zone}"
  tags         = ["reddit-app"]

  boot_disk {
    initialize_params {
      image = "${var.app_disk_image}"
    }
  }

  network_interface {
    network = "default"

    access_config = {
      nat_ip = "${google_compute_address.app_ip.address}"
    }
  }
}

# Правила firewall
resource "google_compute_firewall" "firewall_puma" {
  name    = "allow-puma-default"
  network = "default"

  allow {
    protocol = "tcp"

    ports = ["9292"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["reddit-app"]
}



resource "google_compute_firewall" "firewall_nginx" {
  name        = "default-allow-80-ports"
  description = "Allow NGIX rule"
  network     = "default"

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["reddit-app"]
}
