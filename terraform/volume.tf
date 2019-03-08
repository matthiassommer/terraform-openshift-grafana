/* resource "kubernetes_persistent_volume_claim" "default" {
  metadata {
    name      = "grafana-persistence-volume"
  }

  spec {
    access_modes = ["ReadWriteMany"]

    resources {
      requests {
        storage = "1Gi"
      }
    }

    volume_name = "${kubernetes_persistent_volume.default.metadata.0.name}"
  }
} */

/* resource "kubernetes_persistent_volume" "default" {
  metadata {
    name = "${var.app}"
  }

  spec {
    capacity {
      storage = "1Gi"
    }

    access_modes = ["ReadWriteMany"]

    persistent_volume_source {
      gce_persistent_disk {
        pd_name = "grafana"
      }
    }
  }
} */
