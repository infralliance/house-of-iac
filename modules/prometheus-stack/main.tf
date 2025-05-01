resource "kubernetes_namespace" "monitoring" {
  metadata {
    name = var.namespace_name
  }
}

resource "helm_release" "prometheus_grafana" {
  name       = var.helm_release_name
  repository = var.helm_repository
  chart      = var.helm_chart
  namespace  = kubernetes_namespace.monitoring.metadata[0].name
  version    = var.helm_chart_version

}
