variable "zone" {
  description = "Zone"
  default     = "europe-west1-b"
}

variable "count_vm" {
  default     = 1
  description = "kol-vo vm"
}

variable "app_disk_image" {
  default     = "reddit-app"
  description = "Image for App VM"
}
