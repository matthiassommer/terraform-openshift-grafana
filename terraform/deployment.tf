resource "kubernetes_deployment" "grafana-deployment" {
  metadata {
    name      = "${var.app}"
    namespace = "${var.project}"

    labels {
      app              = "${var.app}"
      deploymentconfig = "${var.app}"
    }
  }

  spec {
    selector {
      match_labels {
        app              = "${var.app}"
        deploymentconfig = "${var.app}"
      }
    }

    strategy {
      type = "Recreate"
    }

    template {
      metadata {
        labels {
          app              = "${var.app}"
          deploymentconfig = "${var.app}"
        }
      }

      spec {
        active_deadline_seconds = "21600"

        container {
          image = "grafana:latest"
          name  = "grafana"

          port {
            container_port = "3000"
            protocol       = "TCP"
          }

          resources {
            limits {
              cpu    = "300m"
              memory = "256Mi"
            }

            requests {
              cpu    = "150m"
              memory = "256Mi"
            }
          }

          volume_mount {
            mount_path = "/var/lib/grafana"
            name       = "volume-xdtzh"
          }

          volume_mount {
            mount_path = "/etc/grafana/grafana.ini"
            name       = "volume-et7q2"
            sub_path   = "grafana.ini"
          }
        }

        volume {
          name = "volume-xdtzh"

          persistent_volume_claim {
            claim_name = "grafana-persistence-volume"
          }
        }

        volume {
          name = "volume-et7q2"

          config_map {
            default_mode = "420"

            items {
              key  = "grafana.ini"
              path = "grafana.ini"
            }

            name = "grafana-config"
          }
        }
      }
    }
  }
}
