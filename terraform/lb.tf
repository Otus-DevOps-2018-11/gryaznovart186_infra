resource "google_compute_instance_group" "reddit-group" {
  name        = "reddit-apps-group"
  description = "Reddit instance group for balance"

  instances = [
    "${google_compute_instance.app.*.self_link}",
  ]

  named_port {
    name = "http"
    port = "9292"
  }

  zone = "${var.zone}"
}

resource "google_compute_http_health_check" "reddit-health" {
  name               = "reddit-apps-health"
  request_path       = "/"
  check_interval_sec = 30
  timeout_sec        = 30
  port               = 9292
}

resource "google_compute_backend_service" "reddit-backend" {
  name        = "reddit-apps-backend"
  port_name   = "http"
  protocol    = "HTTP"
  timeout_sec = 10
  enable_cdn  = false

  backend {
    group = "${google_compute_instance_group.reddit-group.self_link}"
  }

  health_checks = ["${google_compute_http_health_check.reddit-health.self_link}"]
}

resource "google_compute_url_map" "reddit-url-map" {
  name            = "reddit-apps-url-map"
  default_service = "${google_compute_backend_service.reddit-backend.self_link}"
}

resource "google_compute_target_http_proxy" "reddit-http-proxy" {
  name    = "reddit-apps-proxy"
  url_map = "${google_compute_url_map.reddit-url-map.self_link}"
}

resource "google_compute_global_forwarding_rule" "reddit-forwarding" {
  name       = "reddit-rule"
  target     = "${google_compute_target_http_proxy.reddit-http-proxy.self_link}"
  port_range = "80"
}
