provider "google" {
  project = "${var.project}"
  region  = "${var.region}"
}

module "storage-bucket" {
  source  = "SweetOps/storage-bucket/google"
  version = "0.1.1"

  # Имена поменяйте на другие
  name = ["storage-art-test", "storage-art-test2"]
}

output storage-bucket_url {
  value = "${module.storage-bucket.url}"
}
