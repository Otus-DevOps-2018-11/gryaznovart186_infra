variable "zone" {
  description = "Zone"
  default     = "europe-west1-b"
}

variable "count_vm" {
  default     = 1
  description = "kol-vo vm"
}

variable "db_disk_image" {
  default     = "reddit-db"
  description = "Image for App VM"
}
