variable "namespace_name" {
  description = "The name of the Kubernetes namespace for monitoring."
  type        = string
  default     = "monitoring"
}

variable "helm_release_name" {
  description = "The name of the Helm release."
  type        = string
  default     = "kube-prometheus-stack"
}

variable "helm_repository" {
  description = "The Helm repository URL."
  type        = string
  default     = "https://prometheus-community.github.io/helm-charts"
}

variable "helm_chart" {
  description = "The name of the Helm chart."
  type        = string
  default     = "kube-prometheus-stack"
}

variable "helm_chart_version" {
  description = "The version of the Helm chart."
  type        = string
  default     = "58.0.0"  # Replace with the desired version
}
