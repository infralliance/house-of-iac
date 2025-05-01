output "namespace_name" {
  description = "The name of the created Kubernetes namespace."
  value       = kubernetes_namespace.monitoring.metadata[0].name
}

output "helm_release_name" {
  description = "The name of the Helm release."
  value       = helm_release.prometheus_grafana.name
}
