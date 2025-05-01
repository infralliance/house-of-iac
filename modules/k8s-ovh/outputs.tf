output "kubeconfig" {
  description = "The kubeconfig file for accessing the cluster."
  value       = ovh_cloud_project_kube.cluster.kubeconfig
  sensitive   = true
}

output "cluster_id" {
  description = "The ID of the Kubernetes cluster."
  value       = ovh_cloud_project_kube.cluster.id
}
