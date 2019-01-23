variable project {
  description = "Project ID"
}

variable region {
  description = "Region"
  default     = "europe-west1"
}

variable public_key_path {
  description = "Path to the public key used for ssh access"
}

variable "zone" {
  description = "Zone"
  default     = "europe-west1-b"
}

variable "db_disk_image" {
  default     = "reddit-db"
  description = "Image for App VM"
}

variable "app_disk_image" {
  default     = "reddit-app"
  description = "Image for App VM"
}
