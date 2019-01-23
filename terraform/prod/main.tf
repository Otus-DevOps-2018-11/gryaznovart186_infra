provider "google" {
  project = "${var.project}"
  region  = "${var.region}"
}

module "app" {
  source         = "../modules/app"
  zone           = "${var.zone}"
  app_disk_image = "${var.app_disk_image}"
}

module "db" {
  source        = "../modules/db"
  zone          = "${var.zone}"
  db_disk_image = "${var.db_disk_image}"
}

module "firewall_ssh" {
  source          = "../modules/vpc"
  public_key_path = "${var.public_key_path}"
  source_ranges   = ["188.17.37.194/32"]
}
