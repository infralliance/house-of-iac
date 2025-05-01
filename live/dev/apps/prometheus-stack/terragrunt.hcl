terraform {
  source = "../../../../modules/prometheus-stack"
}

inputs = {
  namespace_name     = "monitoring"
  helm_release_name  = "kube-prometheus-stack"
  helm_repository    = "https://prometheus-community.github.io/helm-charts"
  helm_chart         = "kube-prometheus-stack"
  helm_chart_version = "58.0.0"  # Replace with the desired version
}
