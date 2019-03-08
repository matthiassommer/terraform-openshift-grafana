resource "kubernetes_service" "default" {
  metadata {
    name      = "${var.app}"
    namespace = "${var.project}"

    labels {
      app = "${var.app}"
    }
  }

  spec {
    port {
      name        = "3000-tcp"
      port        = "3000"
      target_port = "3000"
      protocol    = "TCP"
    }

    selector {
      deploymentconfig = "grafana"
    }

    session_affinity = "None"
    type             = "ClusterIP"
  }
}
