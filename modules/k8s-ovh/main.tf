provider "ovh" {
  endpoint           = var.ovh_endpoint
  application_key    = var.ovh_application_key
  application_secret = var.ovh_application_secret
  consumer_key       = var.ovh_consumer_key
}

resource "ovh_cloud_project_kube" "cluster" {
  service_name = var.ovh_service_name
  name         = var.cluster_name
  region       = var.region
  version      = var.kube_version
}

resource "ovh_cloud_project_kube_nodepool" "node_pool" {
  service_name  = var.ovh_service_name
  kube_id       = ovh_cloud_project_kube.cluster.id
  name          = var.node_pool_name
  flavor_name   = var.node_pool_flavor
  desired_nodes = var.node_pool_desired_nodes
  max_nodes     = var.node_pool_max_nodes
  min_nodes     = var.node_pool_min_nodes
}

resource "null_resource" "connect_k8s" {
  depends_on = [ovh_cloud_project_kube_nodepool.node_pool]

  provisioner "local-exec" {
    command = <<EOT
      mkdir -p $HOME/.kube
      echo '${ovh_cloud_project_kube.cluster.kubeconfig}' > $HOME/.kube/config
      chmod 600 $HOME/.kube/config
      export KUBECONFIG=$HOME/.kube/config
    EOT
  }
}
